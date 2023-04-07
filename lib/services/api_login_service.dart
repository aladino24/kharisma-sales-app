import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiLoginService {
  static final String apiUrl = 'https://kharismastationerykupang.com/api/';

  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    String login_url = apiUrl + 'ecom/login';

    final response = await http.post(
      Uri.parse(login_url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
    // print(jsonDecode(response.body));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }
}
