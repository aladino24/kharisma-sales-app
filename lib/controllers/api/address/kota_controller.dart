import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kharisma_sales_app/models/kota.dart';
import 'package:kharisma_sales_app/services/api_url.dart';

class KotaController extends GetxController {
  var isLoading = false.obs;
   var selectedKotaId = Rx<Kota?>(null);
  var _listKota = List<Kota>.empty().obs;
  get listKota => _listKota;
  

  Future<void> fetchKotaByProvinsiId(provinsi_id) async {
    String api_address_url = ApiUrl.apiUrl + 'city-raja-ongkir/$provinsi_id';
    try {
      isLoading.value = true;
      // final apiKey = dotenv.env['API_KEY_ADDRESS'];
      final response = await http.get(Uri.parse(api_address_url));

      print(response.body);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        _listKota.assignAll(data.map((e) => Kota.fromJson(e)).toList());
        listKota.value = data.map((json) => Kota.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // clear list kota
  void clearListKota() {
    _listKota.clear();
  }

}
