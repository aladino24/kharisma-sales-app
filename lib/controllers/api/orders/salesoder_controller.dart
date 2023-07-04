import 'dart:convert';

import 'package:get/get.dart';
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/controllers/api/carts/cart_controller.dart';
import 'package:kharisma_sales_app/controllers/components/main_header_controller.dart';
import 'package:kharisma_sales_app/models/cart_product.dart';
import 'package:kharisma_sales_app/models/sales_order.dart';
import 'package:kharisma_sales_app/models/sales_order_count.dart';
import 'package:kharisma_sales_app/services/api_url.dart';
import 'package:http/http.dart' as http;

class SalesorderController extends GetxController{

  final LoginController loginController = Get.put(LoginController());
  final CartController cartController = Get.put(CartController());
  final MainHeaderController mainHeaderController = Get.find<MainHeaderController>();
  var isLoading = false.obs;
  RxList<SalesOrder> salesOrders = <SalesOrder>[].obs;
  var countDraft = '0'.obs;
  var countSale = '0'.obs;
  var countDone = '0'.obs;
  var countCancel = '0'.obs;
  
  @override
  void onInit() {
    super.onInit();
    getSalesOrder(status: 'draft',index: 0);
    getSalesOrderCount();
  }

  Future<String> salesOrderStore(String? uuid, String? total_berat, String? ongkos_kirim, String? jasa_pengiriman) async {
 
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


  Future<String> salesOrderCartStore(List<CartProduct> cartProductList, String? total_berat, String? ongkos_kirim, String? jasa_pengiriman) async {
 
      String api_salesorder_store = ApiUrl.apiUrl + 'ecom/sales-order';

      try {
        isLoading(true);
        Map<String, String> body = {
          'total_berat': total_berat.toString(),
          'ongkos_kirim': ongkos_kirim!,
          'jasa_pengiriman': jasa_pengiriman!,
        };
        for (var i = 0; i < cartProductList.length; i++) {
          String cartId = cartProductList[i].uuid!;
          body['cart_id[$i]'] = cartId;
        }

        final response = await http.post(Uri.parse(api_salesorder_store),
          headers: {
            'Authorization': 'Bearer ${await loginController.getToken()}',
          },
          body: body
        );

        print(response.statusCode);
        if (response.statusCode == 200) {
          isLoading(false);
          print('salesOrderCartStore sukses');
          cartController.fetchCartProduct();
          print(jsonDecode(response.body)['code']);
          mainHeaderController.getCartCount();
          return jsonDecode(response.body)['code'].toString();
        } else {
          print('salesOrderCartStore gagal');
           isLoading(false);
          print(jsonDecode(response.body)['message']);
          throw Exception(jsonDecode(response.body)['message']);
        }
      } catch (e) {
        print('salesOrderCartStore gagal');
         isLoading(false);
        print(e);
        return e.toString(); 
      }finally{
         isLoading(false);
      }
    }

     // clear value method
  void clearValue(){
    salesOrders.clear();
  }

    Future<void> getSalesOrder({String? status, required int index}) async {
      String api_get_salesorder = ApiUrl.apiUrl + 'ecom/sales-order?status=${status}';

      if(index == 0){
       api_get_salesorder = ApiUrl.apiUrl + 'ecom/sales-order?status=draft';
      }else if(index == 1){
        api_get_salesorder = ApiUrl.apiUrl + 'ecom/sales-order?status=sale';
      }else if(index == 2){
        api_get_salesorder = ApiUrl.apiUrl + 'ecom/sales-order?status=done';
      }else{
        api_get_salesorder = ApiUrl.apiUrl + 'ecom/sales-order?status=cancel';
      }

      try {
        isLoading(true);
        final response = await http.get(Uri.parse(api_get_salesorder),
          headers: {
            'Authorization': 'Bearer ${await loginController.getToken()}',
          },
        );

        if(response.statusCode == 200){
          isLoading(false);
          var jsonData = json.decode(response.body);
          SalesOrderResult result = SalesOrderResult.fromJson(jsonData);
          salesOrders.assignAll(result.data!);
        }else{
          isLoading(false);
          print(jsonDecode(response.body)['message']);
          throw Exception(jsonDecode(response.body)['message']);
        }
      } catch (e) {
        isLoading(false);
        print(e);
      }finally{
        isLoading(false);
      }
    }

    Future<void> getSalesOrderCount() async {
      String api_get_salesorder_count = ApiUrl.apiUrl + 'ecom/sales-order/count';

      try {
        isLoading(true);
        final response = await http.get(Uri.parse(api_get_salesorder_count),
          headers: {
            'Authorization': 'Bearer ${await loginController.getToken()}',
          },
        );

        if(response.statusCode == 200){
          isLoading(false);
          var jsonData = json.decode(response.body);
          SalesOrderCountResult result = SalesOrderCountResult.fromJson(jsonData);
          countDraft.value = result.data!.draft!.toString();
          countSale.value = result.data!.sale!.toString();
          countDone.value = result.data!.done!.toString();
          countCancel.value = result.data!.cancel!.toString();
        }else{
          isLoading(false);
          print(jsonDecode(response.body)['message']);
          throw Exception(jsonDecode(response.body)['message']);
        }
      } catch (e) {
        isLoading(false);
        print(e);
      }finally{
        isLoading(false);
      }
    }

}