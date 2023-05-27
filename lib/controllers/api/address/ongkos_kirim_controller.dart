import 'dart:convert';

import 'package:get/get.dart';
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/models/ongkos_kirim.dart';
import 'package:kharisma_sales_app/services/api_url.dart';
import 'package:http/http.dart' as http;

class OngkosKirimController extends GetxController{
  var isLoading = false.obs;
  
  var selectedOngkosKirim = Rx<OngkosKirim?>(null);
  var _listOngkosKirim = List<OngkosKirim>.empty().obs;

  get listOngkosKirim => _listOngkosKirim;

  final LoginController loginController = Get.find<LoginController>();

  @override
  void onInit() {
    super.onInit();
    // fetchOngkosKirim();
  }

  Future<void> fetchOngkosKirim(String? kecamatanId, String? weight) async{
    print(weight);
    String api_url = ApiUrl.apiUrl + 'ecom/ongkos-kirim?kecamatan_id=${kecamatanId}&berat=${weight}';
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse(api_url),
        headers: {
          'Authorization': 'Bearer ${await loginController.getToken()}',
        },
      );

      if(response.statusCode == 200){
        isLoading(false);
        final List<dynamic> data = json.decode(response.body)['data'];
        _listOngkosKirim.assignAll(data.map((e) => OngkosKirim.fromJson(e)).toList());
        listOngkosKirim.value = data.map((json) => OngkosKirim.fromJson(json)).toList();
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