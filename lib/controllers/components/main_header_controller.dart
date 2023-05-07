import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHeaderController extends GetxController{
  var isBookmarkIconSelected = false.obs;
  var isCartIconSelected = false.obs;
  var isNotificationIconSelected = false.obs;
  var isProfileSelected = false.obs;
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();


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
  
}