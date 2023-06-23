import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/views/success/components/default_button.dart';
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
          DefaultButton(
            btnText: 'Ok',
            onPressed: () {
              Get.offAllNamed(RoutesName.home);
            },
          ),
        ],
      ),
    );
  }
}