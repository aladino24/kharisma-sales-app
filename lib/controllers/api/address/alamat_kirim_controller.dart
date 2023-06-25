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
  final recipientKodePosController = TextEditingController();

  // for edit address
  final editRecipientNameController = TextEditingController();
  final editRecipientPhoneController = TextEditingController();
  final editRecipientAddressController = TextEditingController();
  final editRecipientProvinsiController = TextEditingController();
  final editRecipientKotaController = TextEditingController();
  final editRecipientKecamatanController = TextEditingController();
  final editRecipientKodePosController = TextEditingController();

  // for fetch alamat pengiriman
  var isLoading = false.obs;
  var _listAlamat = List<AlamatPengiriman>.empty(growable: true).obs;
  var errorMessage = ''.obs;
  get listAlamat => _listAlamat;
  var alamatPengiriman = AlamatPengiriman().obs;

  @override
  void onInit() {
    super.onInit();
    fetchAlamatPengiriman();
    fetchAlamatUtama();
  }

  // @override
  // void onClose(){
  //   super.onClose();
  //   // recipientNameController.dispose();
  //   // recipientPhoneController.dispose();
  //   // recipientAddressController.dispose();
  //   // recipientProvinsiController.dispose();
  //   // recipientKotaController.dispose();
  //   // recipientKecamatanController.dispose();
  //   // // recipientKelurahanController.dispose();
  //   // recipientKodePosController.dispose();
  // }

  Future<void> fetchAlamatPengiriman() async {
    String api_address_url = ApiUrl.apiUrl + 'ecom/alamat-pengiriman';
  
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(api_address_url), headers: {
        'Authorization': 'Bearer ${await loginController.getToken()}',
      });

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        _listAlamat.assignAll(data.map((e) => AlamatPengiriman.fromJson(e)).toList());

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
  }


  Future<void> editAddress(id) async {
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
      'id' : id.toString(),
      'user_id' : userId.toString(),
      'penerima' : editRecipientNameController.text,
      'no_telepon' : editRecipientPhoneController.text,
      'kota_id' : kotaController.selectedKotaId.value!.cityId,
      'kota' : kotaController.selectedKotaId.value!.cityName,
      'provinsi_id' : provinsiController.selectedProvinsiId.value!.province_id,
      'provinsi' : provinsiController.selectedProvinsiId.value!.province,
      'kecamatan_id' : kecamatanController.selectedKecamatanId.value!.subdistrictId,
      'kecamatan' : kecamatanController.selectedKecamatanId.value!.subdistrictName,
      'kelurahan' : editRecipientAddressController.text,
      'kode_pos' : editRecipientKodePosController.text,
      'alamat' : editRecipientAddressController.text,
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
  }

  Future<void> deleteAddress(String id) async {
    String api_deleteAddress_url = ApiUrl.apiUrl + 'ecom/alamat-pengiriman/' + id;
    try {
      isLoading(true);
      final response = await http.delete(
        Uri.parse(api_deleteAddress_url),
        headers: <String, String> {
          'Authorization': 'Bearer ${await loginController.getToken()}',
          'Content-Type': 'application/json; charset=UTF-8',
        }
      );

      if (response.statusCode == 200) {
        isLoading(false);
        final Map<String, dynamic> responseData = json.decode(response.body);
        print(responseData);
        Get.snackbar(
          'Success', 
          responseData['message'],
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        fetchAlamatPengiriman();
      } else {
        isLoading(false);
        final Map<String, dynamic> responseData = json.decode(response.body);
        throw Exception(responseData['message']);
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
  }

  Future<AlamatPengiriman?> fetchAlamatUtama() async{
    String api_address_url = ApiUrl.apiUrl + 'ecom/alamat-pengiriman';
    
    try {
          isLoading(true);
          final response = await http.get(
            Uri.parse(api_address_url),
            headers: <String, String>{
              'Authorization': 'Bearer ${await loginController.getToken()}',
            },
          );

          if (response.statusCode == 200) {
            isLoading(false);
            final Map<String, dynamic> responseData = json.decode(response.body);
            List<dynamic> data = responseData['data'];
            Map<String, dynamic>? alamatUtamaData = data.firstWhere(
              (element) => element['alamat_utama'] == '1',
              orElse: () => null,
            );
            // print(alamatUtamaData);
            if (alamatUtamaData != null) {
              AlamatPengiriman alamatPengiriman = AlamatPengiriman.fromJson(alamatUtamaData);
               this.alamatPengiriman.value = alamatPengiriman;
              return alamatPengiriman;  
            } else {
              return null;
            }
          } else {
            isLoading(false);
            final Map<String, dynamic> responseData = json.decode(response.body);
            throw Exception(responseData['message']);
          }
      } catch (e) {
        isLoading(false);
        print(e.toString());
        return null;
      }finally{
        isLoading(false);
      }
  }

  Future<void> setAlamatUtama(String id) async{
    String api_setAlamatUtama_url = ApiUrl.apiUrl + 'ecom/alamat-pengiriman/setting-alamat-utama/' + id;

    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse(api_setAlamatUtama_url),
        headers: <String, String> {
          'Authorization': 'Bearer ${await loginController.getToken()}',
          'Content-Type': 'application/json; charset=UTF-8',
        }
      );

      if (response.statusCode == 200) {
        isLoading(false);
        final Map<String, dynamic> responseData = json.decode(response.body);
        print(responseData);
        Get.snackbar(
          'Success', 
          responseData['message'],
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        fetchAlamatPengiriman();
      } else {
        isLoading(false);
        final Map<String, dynamic> responseData = json.decode(response.body);
        throw Exception(responseData['message']);
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
  }
}
