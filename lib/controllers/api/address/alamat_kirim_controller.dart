import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kharisma_sales_app/controllers/api/address/kecamatan_controller.dart';
import 'package:kharisma_sales_app/controllers/api/address/kota_controller.dart';
import 'package:kharisma_sales_app/controllers/api/address/provinsi_controller.dart';
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/models/alamat_pengiriman.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/services/api_url.dart';

class AlamatKirimController extends GetxController {
  var loginController = Get.find<LoginController>();

  // for create new address
  final recipientNameController = TextEditingController();
  final recipientPhoneController = TextEditingController();
  final recipientAddressController = TextEditingController();
  final recipientProvinsiController = TextEditingController();
  final recipientKotaController = TextEditingController();
  final recipientKecamatanController = TextEditingController();
  // final recipientKelurahanController = TextEditingController();
  final recipientKodePosController = TextEditingController();

  // for fetch alamat pengiriman
  var isLoading = false.obs;
  // var inputNotif = false.obs;
  var _listAlamat = List<AlamatPengiriman>.empty(growable: true).obs;
  var errorMessage = ''.obs;

  get listAlamat => _listAlamat;

  @override
  void onInit() {
    super.onInit();
    fetchAlamatPengiriman();
  }

  @override
  void onClose(){
    recipientNameController.dispose();
    recipientPhoneController.dispose();
    recipientAddressController.dispose();
    recipientProvinsiController.dispose();
    recipientKotaController.dispose();
    recipientKecamatanController.dispose();
    // recipientKelurahanController.dispose();
    recipientKodePosController.dispose();
    super.onClose();
  }

  Future<void> fetchAlamatPengiriman() async {
    String api_address_url = ApiUrl.apiUrl + 'ecom/alamat-pengiriman';
  
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(api_address_url), headers: {
        'Authorization': 'Bearer ${await loginController.getToken()}',
      });

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        _listAlamat
            .assignAll(data.map((e) => AlamatPengiriman.fromJson(e)).toList());

        // print(alamatPengirimanResult.data);
      } else {
        errorMessage.value = json.decode(response.body)['message'];
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> createNewAddress() async {
    String api_address_url = ApiUrl.apiUrl + 'ecom/alamat-pengiriman';
    var provinsiController = Get.find<ProvinsiController>();
    var kotaController = Get.find<KotaController>();
    var kecamatanController = Get.find<KecamatanController>();
    // var kelurahanController = Get.find<KelurahanController>();
      final userModel = await loginController.getUserModel();

     if (userModel == null) {
        return;
      }
      final userId = userModel.id;
      // print(id);
    final Map<String, dynamic> data = {
      'user_id' : userId.toString(),
      'penerima' : recipientNameController.text,
      'no_telepon' : recipientPhoneController.text,
      'kota_id' : kotaController.selectedKotaId.value!.cityId,
      'kota' : kotaController.selectedKotaId.value!.cityName,
      'provinsi_id' : provinsiController.selectedProvinsiId.value!.province_id,
      'provinsi' : provinsiController.selectedProvinsiId.value!.province,
      'kecamatan_id' : kecamatanController.selectedKecamatanId.value!.subdistrictId,
      'kecamatan' : kecamatanController.selectedKecamatanId.value!.subdistrictName,
      'kelurahan' : recipientAddressController.text,
      'kode_pos' : recipientKodePosController.text,
      'alamat' : recipientAddressController.text,
    };
    // print(kecamatanController.selectedKecamatanId.value!.subdistrictName);

    // store data
    try {
      isLoading(true);
      final response = await http.post(
      Uri.parse(api_address_url),
      body: data,
      headers: {
        'Authorization': 'Bearer ${await loginController.getToken()}',
        // 'Content-Type': 'application/json',
      },
    );

    // print(response.statusCode);

      if (response.statusCode == 200) {
        isLoading(false);
      
        // final Map<String, dynamic> responseData = json.decode(response.body);
        // print(responseData);
        
        Get.offNamedUntil(RoutesName.listAddress,(route) => route.isFirst, arguments: 
          {
            'notif' : true,
          }
        );

      } else {
        isLoading(false);
        throw Exception('Failed to login');

        // final Map<String, dynamic> responseData = json.decode(response.body);
        // print(responseData);
      }
    } catch (e) {
      isLoading(false);
      print(e.toString());
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }finally{
      isLoading(false);
    }
  //  print(userId is int);
  
  }
}
