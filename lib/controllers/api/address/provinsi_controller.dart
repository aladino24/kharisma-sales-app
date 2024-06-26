import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kharisma_sales_app/models/provinsi.dart';
import 'package:kharisma_sales_app/services/api_url.dart';

class ProvinsiController extends GetxController {
  var _listProvinsi = [].obs;
  var selectedProvinsiId = Rx<Provinsi?>(null);
  var selectedKotaId = Rx<String?>(null);
  get listProvinsi => _listProvinsi;

  

  @override
  void onInit() {
    super.onInit();
    fetchProvinsi();
  }
  

  void fetchProvinsi() async {
    String api_address_url = ApiUrl.apiUrl + 'provinsi-raja-ongkir';
    try {
      // final apiKey = dotenv.env['API_KEY_ADDRESS'];
      final response = await http.get(Uri.parse(api_address_url));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        _listProvinsi.assignAll(data.map((e) => Provinsi.fromJson(e)).toList());
        listProvinsi.value = data.map((json) => Provinsi.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void clearListProvinsi() {
    _listProvinsi.clear();
  }
}
