import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kharisma_sales_app/services/api_url.dart';
import 'package:flutter/material.dart';

class ForgotPasswordController extends GetxController{
  final emailController = TextEditingController();
  var isLoading = false.obs;

  Future<void> forgotPassword() async{
    String forgot_password_url = ApiUrl.apiUrl + 'ecom/forgot-password';
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse(forgot_password_url
        ),
        body: {
          'email' : emailController.text
        }
     );

    var jsonResult = json.decode(response.body);
     if (response.statusCode == 200) {
       
      isLoading(false);
       Get.snackbar(
        'Success', jsonResult['message'],
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
     }else{
      isLoading(false);
        Get.snackbar('Error', jsonResult['message']);
     }
    } catch (e) {
      isLoading(false);
      Get.snackbar('Error', e.toString());
    }
  }
}