import 'package:get/get.dart';
import 'package:kharisma_sales_app/bindings/mainheader_binding.dart';
import 'package:kharisma_sales_app/controllers/components/main_header_controller.dart';
import 'package:kharisma_sales_app/views/home/detail_product_page.dart';
import 'package:kharisma_sales_app/views/home/home_page.dart';
import 'package:kharisma_sales_app/views/login/forgot_password_page.dart';
import 'package:kharisma_sales_app/views/login/login_customer_page.dart';
import 'package:kharisma_sales_app/views/login/login_sales_page.dart';
import 'package:kharisma_sales_app/views/product/cart_checkout_page.dart';
import 'package:kharisma_sales_app/views/product/cart_product_page.dart';
import 'package:kharisma_sales_app/views/product/checkout_product_page.dart';
import 'package:kharisma_sales_app/views/product/detail_salesorder_page.dart';
import 'package:kharisma_sales_app/views/product/save_product_page.dart';
import 'package:kharisma_sales_app/views/product/notification_product_page.dart';
import 'package:kharisma_sales_app/views/profile/add_address_page.dart';
import 'package:kharisma_sales_app/views/profile/call_center_page.dart';
import 'package:kharisma_sales_app/views/profile/detail_address_page.dart';
import 'package:kharisma_sales_app/views/profile/edit_address_page.dart';
import 'package:kharisma_sales_app/views/profile/edit_profile_page.dart';
import 'package:kharisma_sales_app/views/profile/kebijakan_privasi_page.dart';
import 'package:kharisma_sales_app/views/profile/list_address_page.dart';
import 'package:kharisma_sales_app/views/profile/notifikasi_all_page.dart';
import 'package:kharisma_sales_app/views/profile/profile_customer_page.dart';
import 'package:kharisma_sales_app/views/profile/termcondition_page.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/views/success/success_page.dart';
import 'package:kharisma_sales_app/views/voucher/list_voucher_page.dart';
import 'package:kharisma_sales_app/widgets/detail_image.dart';

class AppsRoutes{
  static final pages = [
    GetPage(name: RoutesName.loginCustomer, page: () => LoginCustomerPage(), binding: MainHeaderBinding()),
    GetPage(name: RoutesName.loginSales, page: () => LoginSalesPage(),),
    GetPage(name: RoutesName.forgotPassword, page: () => ForgotPasswordPage()),
    GetPage(name: RoutesName.home, page: ()=> HomePage(), binding: BindingsBuilder(() {
        Get.lazyPut<MainHeaderController>(() => MainHeaderController());
      })),
    GetPage(name: RoutesName.detailProduct,  page: () => DetailProductPage()),
    GetPage(name: RoutesName.cartProduct, page: () => CartProductPage()),
    GetPage(name: RoutesName.saveProduct, page: () => SaveProductPage()),
    GetPage(name: RoutesName.notificationProduct, page: () => NotificationProductPage(),  binding: MainHeaderBinding()),
    GetPage(name: RoutesName.profile, page: () => ProfileCustomerPage()),
    GetPage(name: RoutesName.termCondition, page: () => TermConditionPage()),
    GetPage(name: RoutesName.callcenter, page: ()=> CallCenterPage()),
    GetPage(name: RoutesName.cartCheckout, page: ()=> CartCheckoutPage()),
    GetPage(name: RoutesName.checkoutProduct, page: ()=> CheckoutProductPage()),
    GetPage(name: RoutesName.addAddress, page: () => AddAddressPage()),
    GetPage(name: RoutesName.listAddress, page: () => ListAddressPage()),
    GetPage(name: RoutesName.editAddress, page: () => EditAddressPage()),
    GetPage(name: RoutesName.listVoucher, page: () => ListVoucherPage()),
    GetPage(name: RoutesName.editProfile, page: () => EditProfilePage()),
    GetPage(name: RoutesName.orderSuccess, page: () => SuccessPage()),
    GetPage(name: RoutesName.salesOrderDetail, page: () => DetailSalesorderPage()),
    GetPage(name: RoutesName.notifikasiAll, page: () => NotifikasiAllPage()),
    GetPage(name: RoutesName.kebijakanPrivasi, page: () => KebijakanPrivasiPage()),
    GetPage(name: RoutesName.detailAddress, page: () => DetailAddressPage()),
    GetPage(name: RoutesName.detailImage, page: () => DetailImage())
  ];
}