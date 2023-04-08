import 'package:flutter/cupertino.dart';
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

     if (response.statusCode == 200) {
      isLoading(false);
       Get.snackbar(
        'Success', 'Password reset link sent to your email',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
     }else{
      isLoading(false);
        Get.snackbar('Error', 'Invalid email');
     }
    } catch (e) {
      isLoading(false);
      Get.snackbar('Error', 'Telah terjadi kesalahan');
    }
  }
}