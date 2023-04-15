import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/models/kecamatan.dart';
import 'package:kharisma_sales_app/services/api_url.dart';
import 'package:http/http.dart' as http;

class KecamatanController extends GetxController{
  var isLoading = false.obs;
  var selectedKecamatanId = Rx<String?>(null);
  var _listKecamatan = List<Kecamatan>.empty().obs;
  get listKecamatan => _listKecamatan;

  Future<void> fetchKecamatanByKotaId(kota_id) async {
    String api_address_url = ApiUrl.apiAddressUrl + 'kecamatan?kota_id=$kota_id';
    try {
      isLoading.value = true;
      final apiKey = dotenv.env['API_KEY_ADDRESS'];
      final response = await http.get(
        Uri.parse(api_address_url), 
        headers: {'X-API-KEY': '$apiKey'}
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        _listKecamatan.assignAll(data.map((e) => Kecamatan.fromJson(e)).toList());
        listKecamatan.value = data.map((json) => Kecamatan.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // clear list kecamatan
  void clearListKecamatan() {
    _listKecamatan.clear();
  }
}