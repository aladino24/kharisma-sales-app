import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/services/api_url.dart';
import 'package:kharisma_sales_app/views/profile/edit_profile_page.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController{
  var isLoading = false.obs;
  var numberWhatsapp = ''.obs;
  final EditProfilePage editProfilePage = Get.put(EditProfilePage());
  final LoginController loginController = Get.put(LoginController());

@override
  void onInit() {
    super.onInit();
    getWhatsapp();
  }

  
Future<void> editProfile(String name, String email, String telepon, String alamat, String nama_toko, String alamat_toko, String kelurahan, String kecamatan, String kota,String provinsi, String zip, String lat, String lng) async{
    String edit_profile_url = ApiUrl.apiUrl + 'ecom/profile';

    try {
      isLoading(true);
      final response = await http.put(
        Uri.parse(edit_profile_url),
        body: {
          'type' : 'pelanggan',
          'email': email,
          'nama': name,
          'telepon': telepon,
          'alamat': alamat,
          'nama_toko' : nama_toko,
          'alamat_toko' : alamat_toko,
          'kelurahan' : kelurahan,
          'kecamatan' : kecamatan,
          'kota' : kota,
          'provinsi' : provinsi,
          'zip' : zip,
          'lat' : lat,
          'lng' : lng,
        },
        headers: {
          'Authorization': 'Bearer ${await loginController.getToken()}',
        },
      );

      if (response.statusCode == 200) {
        isLoading(false);
        final Map<String, dynamic> responseData = json.decode(response.body);
        
        Get.snackbar(
          'Success',
          responseData['message'],
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        Get.offNamed(
          RoutesName.editProfile
        );
        loginController.fetchUser();
      } else {
        
        isLoading(false);
        final Map<String, dynamic> responseData = json.decode(response.body);
        throw Exception(responseData['errors']);
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

  Future<void> getWhatsapp()async {
    String whatsapp_url = ApiUrl.apiUrl + 'call-center';

    try {
      isLoading(true);
      final response = await http.get(Uri.parse(whatsapp_url));

      if (response.statusCode == 200) {
        isLoading(false);
        final Map<String, dynamic> responseData = json.decode(response.body);
        // print('wa' + responseData['data']);
        numberWhatsapp.value =  responseData['data'];
      } else {
        isLoading(false);
        final Map<String, dynamic> responseData = json.decode(response.body);
        throw Exception(responseData['errors']);
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
    }
  }
}