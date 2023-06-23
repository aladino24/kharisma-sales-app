import 'dart:convert';

import 'package:get/get.dart';
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/services/api_url.dart';
import 'package:http/http.dart' as http;

class SalesorderController extends GetxController{

  final LoginController loginController = Get.put(LoginController());
  var isLoading = false.obs;
  
  @override
  void onInit() {
    super.onInit();
  }

  Future<String> salesOrderStore(String? uuid, String? total_berat, String? ongkos_kirim, String? jasa_pengiriman) async {
    print(uuid);
    print(total_berat);
    print(ongkos_kirim);
    print(jasa_pengiriman);
      String api_salesorder_store = ApiUrl.apiUrl + 'ecom/sales-order';

      try {
        isLoading(true);
        final response = await http.post(Uri.parse(api_salesorder_store),
          headers: {
            'Authorization': 'Bearer ${await loginController.getToken()}',
          },
          body: {
            'cart_id[0]' : uuid!,
            'total_berat' : total_berat.toString(),
            'ongkos_kirim' : ongkos_kirim!,
            'jasa_pengiriman' : jasa_pengiriman!,
          }
        );

        print(response.statusCode);
        if (response.statusCode == 200) {
          isLoading(false);
          print(jsonDecode(response.body)['code']);
          return jsonDecode(response.body)['code'].toString();
        } else {
           isLoading(false);
          print(jsonDecode(response.body)['message']);
          throw Exception(jsonDecode(response.body)['message']);
        }
      } catch (e) {
         isLoading(false);
        print(e);
        return e.toString(); 
      }finally{
         isLoading(false);
      }
    }

}