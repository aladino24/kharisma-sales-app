import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/views/home/home_page.dart';
import 'package:kharisma_sales_app/views/login/login_customer_page.dart';
import 'package:kharisma_sales_app/routes/apps_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (snapshot.hasData) {
          bool hasToken = snapshot.data!.getString('token') != null;
          if (hasToken) {
            return GetMaterialApp(
              title: "Kharisma Sales App",
              home: HomePage(),
              initialRoute: '/',
              defaultTransition: Transition.noTransition,
              getPages: AppsRoutes.pages,
            );
          }
        }
        
        return GetMaterialApp(
          title: "Kharisma Sales App",
          home: LoginCustomerPage(),
          initialRoute: '/',
          defaultTransition: Transition.noTransition,
          getPages: AppsRoutes.pages,
        );
      },
    );
  }
}
