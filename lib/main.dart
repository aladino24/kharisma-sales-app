import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/pages/login/login_customer_page.dart';
import 'package:kharisma_sales_app/routes/apps_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Kharisma Sales App",
      home: LoginCustomerPage(),
      initialRoute: '/',
      getPages: AppsRoutes.pages,
    );
  }
}