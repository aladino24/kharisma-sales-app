import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/models/voucher.dart';
import 'package:kharisma_sales_app/services/api_url.dart';

class VoucherController extends GetxController{
  var loginController = Get.find<LoginController>();
  var _listVoucher = List<Voucher>.empty().obs;

  get listVoucher => _listVoucher;
  
  @override
  void onInit() {
    fetchVoucher();
    super.onInit();
  }

   Future<void> fetchVoucher() async{
    String api_voucher_url = ApiUrl.apiUrl + 'ecom/kode-voucher';

    try {
      final response = await http.get(Uri.parse(api_voucher_url),headers: {
        'Authorization': 'Bearer ${await loginController.getToken()}',
      });
      if(response.statusCode == 200){
        final data = jsonDecode(response.body)['data'];
        _listVoucher.assignAll(List<Voucher>.from(data.map((voucher) => Voucher.fromJson(voucher))));
      }
    } catch (e) {
      print(e);
    }
   }
}