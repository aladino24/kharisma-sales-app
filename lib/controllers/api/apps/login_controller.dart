import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/controllers/api/address/alamat_kirim_controller.dart';
import 'package:kharisma_sales_app/controllers/api/profile/profile_controller.dart';
import 'package:kharisma_sales_app/controllers/components/main_header_controller.dart';
import 'package:kharisma_sales_app/models/user_model.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/services/api_login_service.dart';
import 'package:kharisma_sales_app/services/api_url.dart';
import 'package:kharisma_sales_app/services/global_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final emailCustomerController = TextEditingController();
  final emailSalesController = TextEditingController();
  final passwordController = TextEditingController();
  final tokenController = TextEditingController();
    final _emails = <String>[].obs;
  List<String> get emails => _emails;

  final selectedEmail = RxString('');
  var isLoading = false.obs;
  // fetch user
  var userModelData = UserModel().obs;
  

  @override
  void onClose() {
    // emailCustomerController.dispose();
    // emailSalesController.dispose();
    // passwordController.dispose();
    // tokenController.dispose();
    super.onClose();
  }

  @override
  void onInit(){
    super.onInit();
    fetchEmailSales();
    fetchUser();
  }

  Future<void> loginCustomer() async {
    try {
      isLoading(true);
      final response = await ApiLoginService.loginCustomer(
          emailCustomerController.text, passwordController.text);
      // print(response['data']['token']);
      final token = response['data']['token'];
      final user = response['data']['user'];
      final UserModel userModels = UserModel.fromJson(user);

      await saveToken(token);
      await saveAuthData(userModels);
      GlobalData.hasToken.value = true;
      update(['mainheader']);
      isLoading(false);
      Get.offNamed(RoutesName.home);
      fetchUser();
    } catch (e) {
      GlobalData.clearData();
      print(e);
      isLoading(false);
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> loginSales() async {
    try {
      isLoading(true);
      final response = await ApiLoginService.loginSales(
          emailSalesController.text, tokenController.text);
      // print(response['data']['token']);
      final token = response['data']['token'];
      final user = response['data']['user'];
      final UserModel userModels = UserModel.fromJson(user);

      await saveToken(token);
      await saveAuthData(userModels);
      GlobalData.hasToken.value = true;
      update(['mainheader']);
      isLoading(false);
      Get.offAllNamed(RoutesName.home);
    } catch (e) {
       GlobalData.clearData();
      print(e);
      isLoading(false);
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> logout() async {
    try {
      await http.post(
        Uri.parse(ApiUrl.apiUrl + 'ecom/logout'),
        headers: {'Authorization': 'Bearer ${await getToken()}'},
      );
      // Membersihkan token dan data pengguna dari penyimpanan lokal
      await clearAuthData();

      emailCustomerController.clear();
      emailSalesController.clear();
      passwordController.clear();
      tokenController.clear();

      GlobalData.clearData();

      // hapus semua value getx
      Get.delete<LoginController>();
      Get.delete<UserModel>();
      Get.delete<AlamatKirimController>();
      Get.delete<ProfileController>();
      Get.delete<MainHeaderController>();

      //Get delete all
      Get.deleteAll();
      Get.offAllNamed(RoutesName.loginCustomer);
      
    } catch (e) {
      print(e);
    }
  }

// menyimpan token
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

// menyimpan data pengguna
  Future<void> saveAuthData(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', jsonEncode(user.toJson()));
  }

  // Membersihkan token dan data pengguna dari penyimpanan lokal
  Future<void> clearAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // mendapatkan token
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  // get data user
  Future<UserModel?> getUserModel() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('user');
    if (jsonString == null) {
      return null;
    }
    final jsonMap = jsonDecode(jsonString);
    return UserModel.fromJson(jsonMap);
  }


  Future<UserModel?> fetchUser() async {
    final apiUrl = ApiUrl.apiUrl + 'ecom/profile';

    try {
      isLoading(true);
      final response = await http.get(Uri.parse(apiUrl), headers: {
        'Authorization': 'Bearer ${await getToken()}',
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body)['data'];
        print(data);
        userModelData.value = UserModel.fromJson(data);
        return userModelData.value;
      } else {
        throw Exception(json.decode(response.body)['message']);
      }
    } catch (e) {
      print(e.toString());
      return null;
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchEmailSales() async{
    String apiUrl = ApiUrl.apiUrl + 'sales-email';
    final response = await http.get(Uri.parse(apiUrl));
    try {
      if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<String> emails = (jsonData['data'] as List)
          .map((data) => data['email'] as String)
          .toList();
      _emails.assignAll(emails);
      } else {
        throw Exception(json.decode(response.body)['message']);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
