import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/models/alamat_pengiriman.dart';
import 'package:kharisma_sales_app/services/api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlamatKirimController extends GetxController{
  var isLoading = false.obs;
  var _listAlamat = List<AlamatPengiriman>.empty(growable: true).obs;
  var errorMessage = ''.obs;

  get listAlamat => _listAlamat;

  @override
  void onInit() {
    super.onInit();
    fetchAlamatPengiriman();
  }
  

  var loginController = Get.find<LoginController>();

  Future<void> fetchAlamatPengiriman()async {
    String api_address_url = ApiUrl.apiUrl + 'ecom/alamat-pengiriman';
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse(api_address_url),
        headers: {
          'Authorization': 'Bearer ${ await getToken()}',
        }
      );

      if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
        _listAlamat.assignAll(data.map((e) => AlamatPengiriman.fromJson(e)).toList());

        // print(alamatPengirimanResult.data);
      } else {
        errorMessage.value = 'Terjadi kesalahan saat memuat data';
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
  
}