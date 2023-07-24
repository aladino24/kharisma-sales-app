import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/controllers/components/main_header_controller.dart';
import 'package:kharisma_sales_app/models/product.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/services/api_url.dart';
import 'package:http/http.dart' as http;

class SaveProductController extends GetxController{
   var _products = <Product>[].obs;
   List<Product> get products => _products;
   var isLoading = false.obs;

   final LoginController loginController = Get.find<LoginController>();
   final MainHeaderController mainHeaderController = Get.find<MainHeaderController>();

   @override
    void onInit() {
      super.onInit();
      fetchProduct();
    }
   


   Future<void> fetchProduct() async {
    String api_product_url = ApiUrl.apiUrl + 'ecom/wishlist';

     try {
       isLoading(true);
       final response = await http.get(
        Uri.parse(api_product_url),
        // bearer token
        headers: {
          'Authorization': 'Bearer ${await loginController.getToken()}',
        },
      );
        if(response.statusCode == 200){
          print(jsonDecode(response.body)['data']);
          isLoading(false);
          final data = jsonDecode(response.body)['data'];
          _products.assignAll(List<Product>.from(data.map((product) => Product.fromJson(product))));
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
   


   Future<void> saveProduct(int? productId) async{
      String api_product_url = ApiUrl.apiUrl + 'ecom/wishlist';
      print(productId);
      try {
        isLoading(true);
        final response = await http.post(
          Uri.parse(api_product_url),
          // bearer token
          headers: {
            'Authorization': 'Bearer ${await loginController.getToken()}',
          },
          body: 
            {
              'product_id': productId.toString(),
            }
        );
          if(response.statusCode == 200){
            print(jsonDecode(response.body));
            isLoading(false);
            // final data = jsonDecode(response.body)['data'];
            // _products.assignAll(List<Product>.from(data.map((product) => Product.fromJson(product))));
            // Get.toNamed(
            //   RoutesName.saveProduct
            // );
            fetchProduct();
            mainHeaderController.getWishlistCount();
          }else{
            isLoading(false);
            throw Exception(jsonDecode(response.body)['message']);
          }
      } catch (e) {
          isLoading(false);
          if(e.toString() == 'Exception: Unauthorized'){
            errorMessage('Silahkan Login Terlebih Dahulu');
            await Get.offAllNamed(RoutesName.loginCustomer);
          }
          print(e.toString());
      }finally{
        isLoading(false);
      }
   }

   Future<void> deleteProduct(String? productId) async{
      String api_product_url = ApiUrl.apiUrl + 'ecom/wishlist';
      try {
        isLoading(true);
        final response = await http.delete(
          Uri.parse(api_product_url),
          // bearer token
          headers: {
            'Authorization': 'Bearer ${await loginController.getToken()}',
          },
          body:
            {
              'product_id': productId,
            }
        );
          if(response.statusCode == 200){
            print(jsonDecode(response.body)['data']);
            isLoading(false);
            // final data = jsonDecode(response.body)['data'];
            // _products.assignAll(List<Product>.from(data.map((product) => Product.fromJson(product))));
            fetchProduct();
            mainHeaderController.getWishlistCount();
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

    void errorMessage(String message){
    Get.snackbar(
      'Gagal',
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }


}