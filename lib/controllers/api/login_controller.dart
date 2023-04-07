import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/models/user_model.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/services/api_login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final emailCustomerController = TextEditingController();
  final emailSalesController = TextEditingController();
  final passwordController = TextEditingController();
  final tokenController = TextEditingController();
  var isLoading = false.obs;

  @override
  void onClose() {
    emailCustomerController.dispose();
    emailSalesController.dispose();
    passwordController.dispose();
    tokenController.dispose();
    super.onClose();
  }

  static final String apiUrl = 'https://kharismastationerykupang.com/api/';

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
      isLoading(false);
      Get.offNamed(RoutesName.home);
    } catch (e) {
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
      isLoading(false);
      Get.offNamed(RoutesName.home);
    } catch (e) {
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
        Uri.parse(ApiLoginService.apiUrl + 'ecom/logout'),
        headers: {'Authorization': 'Bearer $getToken()'},
      );
      // Membersihkan token dan data pengguna dari penyimpanan lokal
      await clearAuthData();
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


}
