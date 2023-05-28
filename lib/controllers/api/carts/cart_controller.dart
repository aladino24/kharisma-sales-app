import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/models/cart_product.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/services/api_url.dart';

class CartController extends GetxController{
  var isLoading = false.obs;
  var cartProductList = List<CartProduct>.empty().obs;
  var loginController = Get.put(LoginController());
  var isAllSelected = false.obs;

  var quantityGlobal = 0.obs;

  

   @override
  void onInit() {
    super.onInit();
    fetchCartProduct();
  }
  

   Future<void> fetchCartProduct()async {
     String api_cart_product = ApiUrl.apiUrl + 'ecom/cart';
      try {
        isLoading(true);
        final response = await http.get(
          Uri.parse(api_cart_product),
          headers: {
             'Authorization': 'Bearer ${await loginController.getToken()}',
              // 'Content-Type': 'application/json',
           },
        );

        if(response.statusCode == 200){
           isLoading(false);
           var jsonResult = json.decode(response.body);
           cartProductList.value = List<CartProduct>.from(jsonResult['data'].map((cartProduct) => CartProduct.fromJson(cartProduct)));
        }else{
          isLoading(false);
          throw Exception(jsonDecode(response.body)['message']);
        }
      } catch (e) {
        isLoading(false);
        print(e.toString());
      }finally{
        isLoading(false);
      }
   }


   // post data
    Future<void> addCartProduct(String productId, String price, int qty)async {
      String api_cart_product = ApiUrl.apiUrl + 'ecom/cart';
        try {
          isLoading(true);
          final response = await http.post(
            Uri.parse(api_cart_product),
            headers: {
              'Authorization': 'Bearer ${await loginController.getToken()}',
                'Content-Type': 'application/json',
            },
            body: jsonEncode(<String, String>{
              'product_id': productId,
              'price' : price,
              'quantity': qty.toString(),
            }),
          );

          // print(response.body);
  
          if(response.statusCode == 200){
            isLoading(false);
            var jsonResult = json.decode(response.body);
            // get.snackbar
            Get.snackbar(
              'Success',
              jsonResult['message'],
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );

            Get.toNamed(
              RoutesName.cartProduct
            );

            fetchCartProduct();
            // update();
          }else{
            isLoading(false);
            throw Exception(jsonDecode(response.body)['message']);
          }
        } catch (e) {
          isLoading(false);
          print(e.toString());

          // get.snackbar
          errorMessage(e.toString());
        }finally{
          isLoading(false);
        }
    }

    Future<void> addCartQuantity(String productId, String price, int qty)async {
      String api_cart_product = ApiUrl.apiUrl + 'ecom/cart';
        try {
          // isLoading(true);
          final response = await http.post(
            Uri.parse(api_cart_product),
            headers: {
              'Authorization': 'Bearer ${await loginController.getToken()}',
                'Content-Type': 'application/json',
            },
            body: jsonEncode(<String, String>{
              'product_id': productId,
              'price' : price,
              'quantity': qty.toString(),
            }),
          );

          // print(response.body);
  
          if(response.statusCode == 200){
            isLoading(false);
            var jsonResult = json.decode(response.body);
            print(jsonResult['message']);
            fetchCartProduct();
          }else{
            isLoading(false);
            throw Exception(jsonDecode(response.body)['message']);
          }
        } catch (e) {
          isLoading(false);
          print(e.toString());

          // get.snackbar
          errorMessage(e.toString());
        }finally{
          isLoading(false);
        }
    }

    Future<void> updateCartProduct(String uuid, String productId, String price, int quantity)async {
      String api_cart_product = ApiUrl.apiUrl + 'ecom/cart/${uuid}';
        try {
          // isLoading(true);
          final response = await http.put(
            Uri.parse(api_cart_product),
            headers: {
              'Authorization': 'Bearer ${await loginController.getToken()}',
                'Content-Type': 'application/json',
            },
            body: jsonEncode(<String, String>{
              'product_id': productId,
              'price' : price,
              'quantity': quantity.toString(),
            }),
          );

          // print(response.body);
  
          if(response.statusCode == 200){
            isLoading(false);
            var jsonResult = json.decode(response.body);
            print(jsonResult['message']);
            fetchCartProduct();
          }else{
            isLoading(false);
            throw Exception(jsonDecode(response.body)['message']);
          }
        } catch (e) {
          isLoading(false);
          print(e.toString());

          // get.snackbar
          errorMessage(e.toString());
        }finally{
          isLoading(false);
        }
    }


    Future<void> deleteCartProduct(String uuid) async{
      String api_cart_product = ApiUrl.apiUrl + 'ecom/cart/' + uuid;
        try {
          // isLoading(true);
          final response = await http.delete(
            Uri.parse(api_cart_product),
            headers: {
              'Authorization': 'Bearer ${await loginController.getToken()}',
                'Content-Type': 'application/json',
            },
          );

          // print(response.body);
  
          if(response.statusCode == 200){
            isLoading(false);
            var jsonResult = json.decode(response.body);
            // get.snackbar
           print(jsonResult['message']);

            fetchCartProduct();
            update(
              ['${uuid}']
            );
          }else{
            isLoading(false);
            throw Exception(jsonDecode(response.body)['message']);
          }
        } catch (e) {
          isLoading(false);
          print(e.toString());

          // get.snackbar
          errorMessage(e.toString());
        }finally{
          isLoading(false);
        }
    }

    
  void increment(RxInt quantity, String stock, int index, String price, String productId, RxInt totalCart){
    if(quantity.value < int.parse(stock)){
      addCartQuantity(productId,price,1);
      totalCart.value = 0;
    }
    update(
        [index]
    );
  }

  void decrement(String uuid,String productId, RxInt quantity, String stock, int index, String price, RxInt totalCart){
    if(quantity.value > 1){
      updateCartProduct(uuid, productId, price, quantity.value - 1);
      totalCart.value = 0;
    }
     update(
        [index]
     );
  }

  void selectAll() {
    isAllSelected.value = !isAllSelected.value;
    
    cartProductList.forEach((cartProduct) {
      cartProduct.isSelected = isAllSelected.value;
    });
    
    update();
  }

  void selectCartProduct(int index, RxInt quantity, String uuid){
    cartProductList[index].isSelected = !cartProductList[index].isSelected;
    // quantity ketika dichecklist masih sama quantity seperti sebelumnya berdasarkan uuid
    quantity.value = cartProductList[index].isSelected ? quantity.value : quantityGlobal.value;
    
    quantityGlobal.value = int.parse(cartProductList[index].quantity!);
    isAllSelected.value = cartProductList.every((cartProduct) => cartProduct.isSelected);
    // update();
    update(
      ['${uuid}']
    );
  }

  // function error message
  void errorMessage(String message){
    Get.snackbar(
      'Gagal',
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }


  
}