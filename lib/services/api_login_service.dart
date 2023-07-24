import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kharisma_sales_app/services/api_url.dart';
import 'package:kharisma_sales_app/services/global_data.dart';

class ApiLoginService {
  

  static Future<Map<String, dynamic>> loginCustomer(
      String email, String password) async {
    String login_url = ApiUrl.apiUrl + 'ecom/login';

    final response = await http.post(
      Uri.parse(login_url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
    print(jsonDecode(response.body));

    if (response.statusCode == 200) {
      GlobalData.hasToken.value = true;
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  static Future<Map<String, dynamic>> loginSales(String email, String token) async {
    String login_url = ApiUrl.apiUrl + 'ecom/login';

    final response = await http.post(
      Uri.parse(login_url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{'sales_email': email, 'keylog': token}),
    );
    // print(jsonDecode(response.body));

    if (response.statusCode == 200) {
      GlobalData.hasToken.value = true;
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }





}
