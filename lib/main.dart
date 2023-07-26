import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/controllers/components/network/bindings/network_binding.dart';
import 'package:kharisma_sales_app/services/global_data.dart';
import 'package:kharisma_sales_app/views/home/home_page.dart';
import 'package:kharisma_sales_app/views/login/login_customer_page.dart';
import 'package:kharisma_sales_app/routes/apps_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// ignore: unused_import
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        
        if (snapshot.hasData) {
          GlobalData.hasToken.value = snapshot.data!.getString('token') != null;
          bool hasToken = snapshot.data!.getString('token') != null;
          if (hasToken) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Kharisma Sales App",
              home: HomePage(),
              initialRoute: '/',
              defaultTransition: Transition.noTransition,
              getPages: AppsRoutes.pages,
              initialBinding: NetworkBinding(),
            );
          }
        }
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Kharisma Sales App",
          home: LoginCustomerPage(),
          initialRoute: '/',
          defaultTransition: Transition.noTransition,
          getPages: AppsRoutes.pages,
          initialBinding: NetworkBinding(),
        );
      },
    );
  }
}
