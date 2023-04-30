import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:kharisma_sales_app/models/product.dart';
import 'package:kharisma_sales_app/services/api_url.dart';

class ProductController extends GetxController{
  var isLoading = false.obs;
  var _products = <Product>[].obs;

  List<Product> get products => _products;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }


  Future<void> fetchProduct() async {
    String api_product_url = ApiUrl.apiUrl + 'ecom/product';

     try {
       isLoading(true);
       final response = await http.get(Uri.parse(api_product_url));
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
}