import 'dart:convert';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/models/notification.dart';
import 'package:kharisma_sales_app/services/api_url.dart';
import 'package:http/http.dart' as http;

class NotificationController extends GetxController{
  var isLoading = false.obs;
  var notificationList = List<NotificationItem>.empty().obs;
  final LoginController loginController = Get.find<LoginController>();


  @override
  void onInit() {
    super.onInit();
    fetchNotification();
  }

   // fetch data notification
   Future<void> fetchNotification() async{
    String api_notification_url = ApiUrl.apiUrl + 'ecom/notification';
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse(api_notification_url),
        headers: {
          'Authorization': 'Bearer ${await loginController.getToken()}',
        },
      );

      if(response.statusCode == 200){
        isLoading(false);
        var jsonResult = json.decode(response.body);
        // print(jsonResult);
        notificationList.value = List<NotificationItem>.from(jsonResult['data'].map((notification) => NotificationItem.fromJson(notification)));
      }else{
        isLoading(false);
        throw Exception(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      isLoading(false);
      print(e.toString());
    }
   }
}