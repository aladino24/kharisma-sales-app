import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/models/buy_now.dart';
import 'package:kharisma_sales_app/models/product.dart';
import 'package:kharisma_sales_app/services/api_url.dart';

class ProductController extends GetxController{
  var isLoading = false.obs;
  var _products = <Product>[].obs;
  var price = "0".obs;
  var totalPrice = 0.obs;

  List<Product> get products => _products;
  Rx<BuyNowResult> buyNowResponse = BuyNowResult().obs;

  final LoginController loginController = Get.put(LoginController());

  // texteditingcontroller value
  final searchEditController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
    getBuyNow();
  }


  Future<void> fetchProduct() async {
    String api_product_url = ApiUrl.apiUrl + 'ecom/product';
    var response;

     try {
       isLoading(true);

       // jika await getToken() tidak sama dengan null  maka kirimkan header bearer token
       if(await loginController.getToken() != null){
          response = await http.get(
            Uri.parse(api_product_url),
            headers: {
              'Authorization': 'Bearer ${await loginController.getToken()}',
            },
          );
       }
        // jika await getToken() sama dengan null  maka kirimkan header bearer token
        if(await loginController.getToken() == null){
            response = await http.get(
              Uri.parse(api_product_url),
            );
        }
       
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

  Future<void> fetchProductByFilter(String? search, String? filter, String? category) async{
      String searchQuery = search?.replaceAll(' ', '+') ?? '';
      String filterQuery = filter?.replaceAll(' ', '+') ?? '';
      String categoryQuery = category?.replaceAll(' ', '+') ?? '';

      String api_product_url = ApiUrl.apiUrl + 'ecom/product';
      var response;
      if (searchQuery.isNotEmpty || filterQuery.isNotEmpty || categoryQuery.isNotEmpty) {
        api_product_url += '?';

        if (searchQuery.isNotEmpty) {
          api_product_url += 'search=$searchQuery';
        }
        if (filterQuery.isNotEmpty) {
          api_product_url += '&filter=$filterQuery';
        }
        if (categoryQuery.isNotEmpty) {
          api_product_url += '&kategori=$categoryQuery';
        }

        print(api_product_url);
      }else{
        fetchProduct();
      }

      try {
        isLoading(true);

       // jika await getToken() tidak sama dengan null  maka kirimkan header bearer token
       if(await loginController.getToken() != null){
          response = await http.get(
            Uri.parse(api_product_url),
            headers: {
              'Authorization': 'Bearer ${await loginController.getToken()}',
            },
          );
       }
        // jika await getToken() sama dengan null  maka kirimkan header bearer token
        if(await loginController.getToken() == null){
            response = await http.get(
              Uri.parse(api_product_url),
            );
        }

        if(response.statusCode == 200){
          // perbarui _product dengan data yang baru
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
      } finally{
        isLoading(false);
     }

  }

  Future<void> buyNow(String? product_id, int? quantity) async {
    String api_buy_now_store = ApiUrl.apiUrl + 'ecom/buy-now?product_id=${product_id}&price=0&quantity=${quantity}';

    try {
      isLoading(true);
      final response = await http.post(Uri.parse(api_buy_now_store),
        headers: {
          'Authorization': 'Bearer ${await loginController.getToken()}',
        },
      );

      print(response.statusCode);

      if(response.statusCode == 200){
        isLoading(false);
        print("sukses");
      }else{
        isLoading(false);
        throw Exception('ini Failed to load data');
      }

    } catch (e) {
      isLoading(false);
      print(e);
    }finally{
      isLoading(false);
    }
  }

  Future<void> getBuyNow() async {
    String api_get_buy_now = ApiUrl.apiUrl + 'ecom/buy-now';

    try {
      isLoading(true);
      final response = await http.get(Uri.parse(api_get_buy_now),
        headers: {
          'Authorization': 'Bearer ${await loginController.getToken()}',
        },
      );

      if(response.statusCode == 200){
        print(response.body);
        final data = jsonDecode(response.body);
        buyNowResponse.value = BuyNowResult.fromJson(data);
        print(buyNowResponse.value);
      }else{
        throw Exception('Failed to load data');
      }

    } catch (e) {
      print("ini" + e.toString());
      isLoading(false);
    } finally{
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
        this.price.value = price;
        this.totalPrice.value = totalPrice;
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



 
}