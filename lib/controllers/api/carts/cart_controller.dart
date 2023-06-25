import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/controllers/api/products/product_controller.dart';
import 'package:kharisma_sales_app/models/cart_product.dart';
import 'package:kharisma_sales_app/models/checkout.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/services/api_url.dart';

class CartController extends GetxController{
  var isLoading = false.obs;
  var cartProductList = List<CartProduct>.empty().obs;
  var loginController = Get.put(LoginController());
  final ProductController productController = Get.put(ProductController());
  Rx<CheckoutResult> checkoutResponse = CheckoutResult().obs;
  var isAllSelected = false.obs;
  var prices = <String, String>{}.obs;
  var totalPrices = <String, int>{}.obs;

  var quantityGlobal = 0.obs;

  

   @override
  void onInit() {
    super.onInit();
    fetchCartProduct();
    getCheckout();
  }
  

   Future<void> fetchCartProduct()async {
     String api_cart_product = ApiUrl.apiUrl + 'ecom/cart';
      try {
        isLoading(true);
        var response = await http.get(
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

    Future<void> getCheckout() async {
    String api_get_checkout = ApiUrl.apiUrl + 'ecom/buy-now';

    try {
      isLoading(true);
      final response = await http.get(Uri.parse(api_get_checkout),
        headers: {
          'Authorization': 'Bearer ${await loginController.getToken()}',
        },
      );

      if(response.statusCode == 200){
        print(response.body);
        // print('Get Checkout sukses');
        final data = jsonDecode(response.body);
        checkoutResponse.value = CheckoutResult.fromJson(data);
        print(checkoutResponse.value);
      }else{
        // print('Get Checkout gagal');
        throw Exception('Failed to load data');
      }

    } catch (e) {
      // print('Get Checkout gagal');
      print("ini" + e.toString());
      isLoading(false);
    } finally{
      isLoading(false);
    }
  }

    Future<void> checkoutProductCart(List<CartProduct> cartProductList)async {
      String api_cart_product = ApiUrl.apiUrl + 'ecom/checkout';
      var body = {};
        try {
          isLoading(true);
          for (var i = 0; i < cartProductList.length; i++) {
              String cartId = cartProductList[i].uuid!;
              body['cart_uuid[$i]'] = cartId;
          }
            final response = await http.post(Uri.parse(api_cart_product),
              headers: {
                'Authorization': 'Bearer ${await loginController.getToken()}',
              },
              body: body
            );
            print(response.statusCode);
            if(response.statusCode == 200){
              isLoading(false);
              var jsonResult = json.decode(response.body);
              print('Checkout Sukses');
              print(jsonResult);
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

  Future<void> checkPrice(String? product_tmpl_id, int quantity) async{
    String api_checkprice = ApiUrl.apiUrl + 'ecom/data-master/check-price?product_tmpl_id=${product_tmpl_id}&quantity=${quantity}';

    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse(api_checkprice),
        headers: {
          'Authorization': 'Bearer ${await loginController.getToken()}',
        },
      );

      if(response.statusCode == 200){
        isLoading(false);
        final data = jsonDecode(response.body)['data'];
        final price = data['price'];
        final totalPrice = data['total_price'];
        prices[product_tmpl_id!] = price; // Simpan price dengan ID yang sesuai
        totalPrices[product_tmpl_id] = totalPrice; // Simpan totalPrice dengan ID yang sesuai
        print('ini price' + prices[product_tmpl_id]!);
      }else{
        isLoading(false);
        throw Exception('Failed to load data');
      }
    } catch (e) {
      isLoading(false);
      print(e);
    }finally{
      isLoading(false);
    }
  }


    
  void increment(String uuid, RxInt quantity, String stock, int index, String price,String productTmplid, String productId, RxInt totalCart){
    if(quantity.value < int.parse(stock)){
       updateCartProduct(uuid, productId, price, quantity.value + 1);
      totalCart.value = 0;
    }
    update(
        [index]
    );
  }

  void decrement(String uuid,String productTmplid, String productId, RxInt quantity, String stock, int index, String price, RxInt totalCart){
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