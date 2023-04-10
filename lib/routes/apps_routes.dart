import 'package:get/get.dart';
import 'package:kharisma_sales_app/views/home/detail_product_page.dart';
import 'package:kharisma_sales_app/views/home/home_page.dart';
import 'package:kharisma_sales_app/views/login/forgot_password_page.dart';
import 'package:kharisma_sales_app/views/login/login_customer_page.dart';
import 'package:kharisma_sales_app/views/login/login_sales_page.dart';
import 'package:kharisma_sales_app/views/product/cart_product_page.dart';
import 'package:kharisma_sales_app/views/product/save_product_page.dart';
import 'package:kharisma_sales_app/views/product/notification_product_page.dart';
import 'package:kharisma_sales_app/views/profile/profile_customer_page.dart';
import 'package:kharisma_sales_app/views/profile/termcondition_page.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';

class AppsRoutes{
  static final pages = [
    GetPage(name: RoutesName.loginCustomer, page: () => LoginCustomerPage()),
    GetPage(name: RoutesName.loginSales, page: () => LoginSalesPage()),
    GetPage(name: RoutesName.forgotPassword, page: () => ForgotPasswordPage()),
    GetPage(name: RoutesName.home, page: ()=> HomePage()),
    GetPage(name: RoutesName.detailProduct,  page: () => DetailProductPage()),
    GetPage(name: RoutesName.cartProduct, page: () => CartProductPage()),
    GetPage(name: RoutesName.saveProduct, page: () => SaveProductPage()),
    GetPage(name: RoutesName.notificationProduct, page: () => NotificationProductPage()),
    GetPage(name: RoutesName.profile, page: () => ProfileCustomerPage()),
    GetPage(name: RoutesName.termCondition, page: () => TermConditionPage())
  ];
}