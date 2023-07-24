import 'dart:convert';

import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/controllers/api/apps/notification_controller.dart';
import 'package:kharisma_sales_app/services/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/services/global_data.dart';

class MainHeaderController extends GetxController{
  var isBookmarkIconSelected = false.obs;
  var isCartIconSelected = false.obs;
  var isNotificationIconSelected = false.obs;
  var isProfileSelected = false.obs;
  var wishlistCount = 0.obs;
  var cartCount = 0.obs;
  var notifCount = 0.obs;
   var loginController = Get.put(LoginController());
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  final NotificationController notificationController = Get.put(NotificationController());

  @override
  void onInit() {
    super.onInit();
    getWishlistCount();
    getCartCount();
    getNotifCount();
  }


  void selectBookmarkIcon(){
    isBookmarkIconSelected.value = true;
    isCartIconSelected.value = false;
    isNotificationIconSelected.value = false;
    isProfileSelected.value = false;
    update();
  }

  void selectCartIcon(){
    isBookmarkIconSelected.value = false;
    isCartIconSelected.value = true;
    isNotificationIconSelected.value = false;
    isProfileSelected.value = false;
    update();
  }

  void selectNotificationIcon(){
    isBookmarkIconSelected.value = false;
    isCartIconSelected.value = false;
    isNotificationIconSelected.value = true;
    isProfileSelected.value = false;
    update();

    // print("Halo");
  }

  void profleIcon(){
    isBookmarkIconSelected.value = false;
    isCartIconSelected.value = false;
    isNotificationIconSelected.value = false;
    isProfileSelected.value = true;
    update();
    // print("Halo");
  }

  void selectAllIcon(){
    isBookmarkIconSelected.value = false;
    isCartIconSelected.value = false;
    isNotificationIconSelected.value = false;
  }

  Future<void> getWishlistCount() async{
    String api_count_cart = ApiUrl.apiUrl + "ecom/wishlist?type=count";

    try {
      final response = await http.get(Uri.parse(api_count_cart),
        headers: {
          'Authorization': 'Bearer ${await loginController.getToken()}',
        },
      );

      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        wishlistCount.value = data['data'];
        // print('ini count ' + wishlistCount.value.toString());
        update();
      }else{
        throw Exception('Failed to load data');
      }

    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getCartCount() async{
    String api_count_cart = ApiUrl.apiUrl + "ecom/cart?type=count";

    try {
      final response = await http.get(Uri.parse(api_count_cart),
        headers: {
          'Authorization': 'Bearer ${await loginController.getToken()}',
        },
      );

      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        cartCount.value = data['data'];
        // print('ini count ' + wishlistCount.value.toString());
        update();
      }else{
        throw Exception('Failed to load data');
      }

    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getNotifCount() async{
    String api_count_cart = ApiUrl.apiUrl + "ecom/notification?type=count";

    try {
      final response = await http.get(Uri.parse(api_count_cart),
        headers: {
          'Authorization': 'Bearer ${await loginController.getToken()}',
        },
      );

      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        notifCount.value = data['data'];
        // print('ini count ' + wishlistCount.value.toString());
        update();
      }else{
        throw Exception('Failed to load data');
      }

    } catch (e) {
      print(e.toString());
    }
  }

  // change GlobalData.hasToken
  void changeHasToken(){
    GlobalData.hasToken.value = true;
    update();
  }

  
  
}