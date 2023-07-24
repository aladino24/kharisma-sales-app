import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/views/success/empty_section.dart';
import 'package:kharisma_sales_app/views/success/sub_title.dart';
import 'components/constant.dart';

class SuccessPage extends StatefulWidget {
  SuccessPage({Key? key}) : super(key: key);

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptySection(
            emptyImg: success,
            emptyMsg: 'Successful !!',
          ),
          SubTitle(
            subTitleText: 'Your order has been successful',
          ),
          // text button
          Container(
            width: 200,
            child: TextButton(
              onPressed: () {
                Get.offNamed(RoutesName.profile);
              },
              style: TextButton.styleFrom(
                backgroundColor: AppsColors.loginColorPrimary,// Warna teks
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Bentuk tombol
                ),
              ),
              child: Text(
                'Ok',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16, // Ukuran teks
                  fontWeight: FontWeight.bold, // Ketebalan teks
                ),
              ),
            ),
          ) 
        ],
      ),
    );
  }
}