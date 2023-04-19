import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/models/kelurahan.dart';
import 'package:kharisma_sales_app/services/api_url.dart';
import 'package:http/http.dart' as http;

class KelurahanController extends GetxController{
  var isLoading = false.obs;
  var selectedKelurahanId = Rx<Kelurahan?>(null);
  var _listKelurahan = List.empty().obs;
  get listKelurahan => _listKelurahan;

  Future<void> fetchKelurahanByKecamatanId(kecamatan_id) async{
    String api_address_url = ApiUrl.apiAddressUrl + 'kelurahan?kecamatan_id=$kecamatan_id';
    
    try {
      isLoading(true);
      final apiKey = dotenv.env['API_KEY_ADDRESS'];
      final response = await http.get(
        Uri.parse(api_address_url), 
        headers: {'X-API-KEY': '$apiKey'}
      );

        print(response.body);
       if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        _listKelurahan.assignAll(data.map((e) => Kelurahan.fromJson(e)).toList());
        listKelurahan.value = data.map((json) => Kelurahan.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
    } finally{
      isLoading(false);
    }
  }

  // clear list kelurahan
  void clearListKelurahan() {
    _listKelurahan.clear();
  }
}