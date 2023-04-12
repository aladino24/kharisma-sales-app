import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kharisma_sales_app/models/provinsi.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProvinsiController extends GetxController {
  var _listProvinsi = [].obs;
  var dropdownItems = <DropdownMenuItem<Object>>[];
  get listProvinsi => _listProvinsi;
  

  @override
  void onInit() {
    super.onInit();
    fetchProvinsi();
  }

  void fetchProvinsi() async {
    try {
      final apiKey = dotenv.env['API_KEY_ADDRESS'];
      final response = await http.get(
          Uri.parse('https://api.goapi.id/v1/regional/provinsi'),
          headers: {'X-API-KEY': '$apiKey'});

      print("Ini apikey" + apiKey.toString());
      // print(response.body);
      if (response.statusCode == 200) {
        // print(response.body);
        final List<dynamic> data = json.decode(response.body)['data'];
        _listProvinsi.assignAll(data.map((e) => Provinsi.fromJson(e)).toList());
        listProvinsi.value = data.map((json) => Provinsi.fromJson(json)).toList();
        dropdownItems = listProvinsi.map((province) {
          return DropdownMenuItem<Object>(
            value: province.id,
            child: Text(province.name),
          );
        }).toList();

        update();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
