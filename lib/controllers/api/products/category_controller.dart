import 'dart:convert';

import 'package:get/get.dart';
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/models/category.dart';
import 'package:kharisma_sales_app/services/api_url.dart';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController{
  var _categoryList = <Category>[].obs;

  var selectedValue = 'All Category'.obs;

  List<Category> get categoryList => _categoryList;
  
  final LoginController loginController = Get.find<LoginController>();

  @override
  void onInit() {
    super.onInit();
    fetchCategory();
  }

  Future<void> fetchCategory() async{
    String api_category_url = ApiUrl.apiUrl + 'ecom/category';
    
    try {
      final response = await http.get(
        Uri.parse(api_category_url),
        headers: {
          'Authorization': 'Bearer ${await loginController.getToken()}',
        },
      );

      if(response.statusCode == 200){
        var jsonResult = json.decode(response.body);
        // print(jsonResult['data']);
        _categoryList.value = List<Category>.from(jsonResult['data'].map((category) => Category.fromJson(category)));
      }else{
        throw Exception(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      print(e.toString());
    }
  }

   void onDropdownValueChanged(newValue) {
    selectedValue.value = newValue ?? 'All Category';
  }
}