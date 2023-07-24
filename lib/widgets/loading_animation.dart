import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void showProgressDialog() {
  Get.dialog(
    Dialog(
      // background transparent
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LoadingAnimationWidget.inkDrop(
              size: 30,
              color: Colors.white,
            ),
            SizedBox(height: 10),
            Text('Please wait...'),
          ],
        ),
      ),
    ),
  );
}

void closeProgressDialog() async{
  // close snackbar
  if (Get.isDialogOpen!) {
    Get.back();
  }
}


