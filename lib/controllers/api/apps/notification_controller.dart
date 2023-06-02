import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/models/notification.dart';
import 'package:kharisma_sales_app/services/api_url.dart';
import 'package:http/http.dart' as http;

class NotificationController extends GetxController{
  var isLoading = false.obs;
  var notificationList = List<NotificationItem>.empty().obs;
  final LoginController loginController = Get.find<LoginController>();


  @override
  void onInit() {
    super.onInit();
    fetchNotificationLimit();
  }

   // fetch data notification
   Future<void> fetchNotificationFull() async{
    String api_notification_url = ApiUrl.apiUrl + 'ecom/notification';
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse(api_notification_url),
        headers: {
          'Authorization': 'Bearer ${await loginController.getToken()}',
        },
      );

      if(response.statusCode == 200){
        isLoading(false);
        var jsonResult = json.decode(response.body);
        // print(jsonResult);
        notificationList.value = List<NotificationItem>.from(jsonResult['data'].map((notification) => NotificationItem.fromJson(notification)));
      }else{
        isLoading(false);
        throw Exception(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      isLoading(false);
      print(e.toString());
    }
   }

   Future<void> fetchNotificationLimit() async{
    String api_notification_url = ApiUrl.apiUrl + 'ecom/notification?limit=3';
    try {
      // isLoading(true);
      final response = await http.get(
        Uri.parse(api_notification_url),
        headers: {
          'Authorization': 'Bearer ${await loginController.getToken()}',
        },
      );

      if(response.statusCode == 200){
        isLoading(false);
        var jsonResult = json.decode(response.body);
        // print(jsonResult);
        notificationList.value = List<NotificationItem>.from(jsonResult['data'].map((notification) => NotificationItem.fromJson(notification)));
      }else{
        isLoading(false);
        throw Exception(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      isLoading(false);
      print(e.toString());
    }
   }

   Future<void> markOneRead(String id) async{
    String api_onereadnotification_url = ApiUrl.apiUrl + 'ecom/notification/mark-one-read/${id}';
    try {
      final response = await http.patch(
        Uri.parse(api_onereadnotification_url),
        headers: {
          'Authorization': 'Bearer ${await loginController.getToken()}',
        },
      );

      if(response.statusCode == 200){
        var jsonResult = json.decode(response.body);
        successMessage(jsonResult['message']);
        fetchNotificationLimit();
      }else{
        throw Exception(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      print(e.toString());
      errorMessage(e.toString());
    }
   }

   Future<void> markAllRead() async{
    String api_allreadnotification_url = ApiUrl.apiUrl + 'ecom/notification/mark-all-read';
    try {
      final response = await http.patch(
        Uri.parse(api_allreadnotification_url),
        headers: {
          'Authorization': 'Bearer ${await loginController.getToken()}',
        },
      );

      if(response.statusCode == 200){
        var jsonResult = json.decode(response.body);
        successMessage(jsonResult['message']);
        fetchNotificationLimit();
      }else{
        throw Exception(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      print(e.toString());
      errorMessage(e.toString());
    }
   }

   void successMessage(String message){
    Get.snackbar(
      'Success',
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: Duration(seconds: 2),
    );
   }

    void errorMessage(String message){
      Get.snackbar(
        'Error',
        message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );
    }
}