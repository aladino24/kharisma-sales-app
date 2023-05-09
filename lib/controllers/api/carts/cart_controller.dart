import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/models/cart_product.dart';
import 'package:kharisma_sales_app/services/api_url.dart';

class CartController extends GetxController{
  var isLoading = false.obs;
  var cartProductList = List<CartProduct>.empty().obs;
  var loginController = Get.find<LoginController>();

   @override

  void onInit() {
    super.onInit();
    fetchCartProduct();
  }

   Future<void> fetchCartProduct()async {
     String api_cart_product = ApiUrl.apiUrl + 'ecom/cart';
      try {
        final response = await http.get(
          Uri.parse(api_cart_product),
          headers: {
             'Authorization': 'Bearer ${await loginController.getToken()}',
              // 'Content-Type': 'application/json',
           },
        );

        if(response.statusCode == 200){
           var jsonResult = json.decode(response.body);
           cartProductList.value = List<CartProduct>.from(jsonResult['data'].map((cartProduct) => CartProduct.fromJson(cartProduct)));
        }else{
          throw Exception(jsonDecode(response.body)['message']);
        }
      } catch (e) {
        print(e.toString());
      }
   }
  
}