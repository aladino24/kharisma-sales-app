import 'package:get/get.dart';
import 'package:kharisma_sales_app/pages/home/detail_product_page.dart';
import 'package:kharisma_sales_app/pages/home/home_page.dart';
import 'package:kharisma_sales_app/pages/login/forgot_password_page.dart';
import 'package:kharisma_sales_app/pages/login/login_customer_page.dart';
import 'package:kharisma_sales_app/pages/login/login_sales_page.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';

class AppsRoutes{
  static final pages = [
    GetPage(name: RoutesName.loginCustomer, page: () => LoginCustomerPage()),
    GetPage(name: RoutesName.loginSales, page: () => LoginSalesPage()),
    GetPage(name: RoutesName.forgotPassword, page: () => ForgotPasswordPage()),
    GetPage(name: RoutesName.home, page: ()=> HomePage()),
    GetPage(name: RoutesName.detailProduct,  page: () => DetailProductPage())
  ];
}