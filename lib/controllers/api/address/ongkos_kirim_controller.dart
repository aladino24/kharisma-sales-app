import 'dart:convert';

import 'package:get/get.dart';
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/models/ongkos_kirim.dart';
import 'package:kharisma_sales_app/services/api_url.dart';
import 'package:http/http.dart' as http;

class OngkosKirimController extends GetxController{
  var isLoading = false.obs;
  var _ongkosKirim = <OngkosKirim>[].obs;

  List<OngkosKirim> get ongkosKirim => _ongkosKirim;

  final LoginController loginController = Get.find<LoginController>();

  @override
  void onInit() {
    super.onInit();
    fetchOngkosKirim();
  }

  Future<void> fetchOngkosKirim() async{
    String api_url = ApiUrl.apiUrl + 'ecom/ongkos-kirim?kecamatan_id=2999&berat=5000';
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
        final data = jsonDecode(response.body)['data'];
        print(data);
        _ongkosKirim.assignAll(List<OngkosKirim>.from(data.map((ongkosKirim) => OngkosKirim.fromJson(ongkosKirim))));
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