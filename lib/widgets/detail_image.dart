import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailImage extends StatelessWidget {
  DetailImage({super.key});

  var image = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Set the background color to transparent
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "Product",
              child: Image.network(image),
            ),
            SizedBox(height: 30),
            OutlinedButton(
              child: Icon(
                Icons.close,
                color: Colors.green,
              ),
              onPressed: () {
                // getx
                Get.back();
              }
            ),
          ],
        ),
      ),
    );
  }
}