import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/models/voucher.dart';
import 'package:kharisma_sales_app/services/api_url.dart';

class VoucherController extends GetxController{
  var loginController = Get.find<LoginController>();
  var _listVoucher = List<Voucher>.empty().obs;

  get listVoucher => _listVoucher;
  var isLoading = false.obs;
  var isLoadingVoucher = false.obs;
  final keyCodeController = TextEditingController();
  
  @override
  void onInit() {
    fetchVoucher();
    super.onInit();
  }

  @override
  void onClose() {
    keyCodeController.dispose();
    super.onClose();
  }
  

   Future<void> fetchVoucher() async{
    String api_voucher_url = ApiUrl.apiUrl + 'ecom/kode-voucher';

    try {
      isLoading(true);
      final response = await http.get(Uri.parse(api_voucher_url),headers: {
        'Authorization': 'Bearer ${await loginController.getToken()}',
      });
      if(response.statusCode == 200){
        isLoading(false);
        final data = jsonDecode(response.body)['data'];
        _listVoucher.assignAll(List<Voucher>.from(data.map((voucher) => Voucher.fromJson(voucher))));
      }
    } catch (e) {
      isLoading(false);
      print(e);
    }finally{
      isLoading(false);
    }
   }

   Future<void> claimVoucher() async {
    String claim_voucher_url = ApiUrl.apiUrl + 'ecom/kode-voucher/claim';
    try {
      isLoadingVoucher(true);
      // print(keyCodeController.text);
      final response  = await http.post(
        Uri.parse(claim_voucher_url),
        headers: {
          'Authorization': 'Bearer ${await loginController.getToken()}',
        },
        body: {
            'kode_voucher': keyCodeController.text,
          }
      );

      // print(response.body);
    
      if(response.statusCode == 200){
        isLoadingVoucher(false);
       
        Get.snackbar(
          'Success',
          jsonDecode(response.body)['message'],
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        fetchVoucher();
      }else{
        isLoadingVoucher(false);
        Get.snackbar('Failed', 
          jsonDecode(response.body)['message'],
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      isLoadingVoucher(false);
      print(e);
    }finally{
      isLoadingVoucher(false);
    }
   }
}