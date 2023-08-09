import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/controllers/api/products/product_controller.dart';
import 'package:kharisma_sales_app/controllers/components/main_header_controller.dart';
import 'package:kharisma_sales_app/models/cart_product.dart';
import 'package:kharisma_sales_app/models/checkout.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/services/api_url.dart';
import '../../../widgets/loading_animation.dart';

class CartController extends GetxController{
  var isLoading = false.obs;
  var cartProductList = List<CartProduct>.empty().obs;
  var loginController = Get.put(LoginController());
  final ProductController productController = Get.put(ProductController());
  final MainHeaderController mainHeaderController = Get.find<MainHeaderController>();
  Rx<CheckoutResult> checkoutResponse = CheckoutResult().obs;
  var isAllSelected = false.obs;
  var prices = <String, String>{}.obs;
  var totalPrices = <String, int>{}.obs;
  RxInt total_bayar = 0.obs;
  var quantityGlobal = 0.obs;
  RxInt remainingStock = 0.obs;

  

   @override
  void onInit() {
    super.onInit();
    fetchCartProductFirstTime();
    fetchCartProduct();
    calculateTotalPrice();
    getCheckout();
  }
  

   Future<void> fetchCartProduct()async {
     String api_cart_product = ApiUrl.apiUrl + 'ecom/cart';
      try {
        isLoading(true);
        var response = await http.get(
          Uri.parse(api_cart_product),
          headers: {
             'Authorization': 'Bearer ${await loginController.getToken()}',
              // 'Content-Type': 'application/json',
           },
        );

        if(response.statusCode == 200){
           isLoading(false);
           var jsonResult = json.decode(response.body);
           cartProductList.value = List<CartProduct>.from(jsonResult['data'].map((cartProduct) => CartProduct.fromJson(cartProduct)));
            calculateTotalPrice();
        }else{
          isLoading(false);
          throw Exception(jsonDecode(response.body)['message']);
        }
      } catch (e) {
        isLoading(false);
        print(e.toString());
      }finally{
        isLoading(false);
      }
   }

   Future<void> selectCartAll(String? selectAll)async {
    print('status' + selectAll!);
     String api_cart_product = ApiUrl.apiUrl + 'ecom/select-cart/${selectAll}';
      try {
        // isLoading(true);
        var response = await http.get(
          Uri.parse(api_cart_product),
          headers: {
             'Authorization': 'Bearer ${await loginController.getToken()}',
              'Content-Type': 'application/json',
           },
        );
        print(response.statusCode);
        if(response.statusCode == 200){
           isLoading(false);
           var jsonResult = jsonDecode(response.body);
           total_bayar.value = int.parse(jsonResult['data']);
           print(total_bayar.value);
        }else{
          isLoading(false);
          throw Exception(jsonDecode(response.body)['message']);
        }
      } catch (e) {
        isLoading(false);
        // print(e.toString());
      }finally{
        isLoading(false);
      }
   }


   Future<void> fetchCartProductNoLoading()async {
     String api_cart_product = ApiUrl.apiUrl + 'ecom/cart';
      try {
        var response = await http.get(
          Uri.parse(api_cart_product),
          headers: {
             'Authorization': 'Bearer ${await loginController.getToken()}',
              // 'Content-Type': 'application/json',
           },
        );

        if(response.statusCode == 200){
           var jsonResult = json.decode(response.body);
           cartProductList.value = List<CartProduct>.from(jsonResult['data'].map((cartProduct) => CartProduct.fromJson(cartProduct)));
        }else{
          isLoading(false);
          throw Exception(jsonDecode(response.body)['message']);
        }
      } catch (e) {
        print(e.toString());
      }finally{
        isLoading(false);
      }
   }

   Future<void> fetchCartProductFirstTime()async{
    String api_cart_product = ApiUrl.apiUrl + 'ecom/cart';
      try {
        isLoading(true);
        var response = await http.get(
          Uri.parse(api_cart_product),
          headers: {
             'Authorization': 'Bearer ${await loginController.getToken()}',
              // 'Content-Type': 'application/json',
           },
        );

        if(response.statusCode == 200){
           isLoading(false);
           var jsonResult = json.decode(response.body);
           cartProductList.value = List<CartProduct>.from(jsonResult['data'].map((cartProduct) => CartProduct.fromJson(cartProduct)));
        }else{
          isLoading(false);
          throw Exception(jsonDecode(response.body)['message']);
        }
      } catch (e) {
        isLoading(false);
        print(e.toString());
      }finally{
        isLoading(false);
      }
   }

  // post data
    Future<void> selectedCheckbox(String uuid, String? isSelected)async {
      print(uuid);
      print(isSelected);
      String api_cart_product = ApiUrl.apiUrl + 'ecom/select-cart/${uuid}/${isSelected}';
        try {
          // isLoading(true);
          final response = await http.get(
            Uri.parse(api_cart_product),
            headers: {
              'Authorization': 'Bearer ${await loginController.getToken()}',
                'Content-Type': 'application/json',
            },
          );

          // print(response.body);
  
          if(response.statusCode == 200){
            final data = jsonDecode(response.body);
            print(data['data']);
            total_bayar.value = int.parse(data['data']);
            
          }else{
            isLoading(false);
            throw Exception(jsonDecode(response.body)['message']);
          }
        } catch (e) {
          isLoading(false);
          print(e.toString());
          errorMessage(e.toString());
        }finally{
          isLoading(false);
        }
    }




   // post data
    Future<void> addCartProduct(
      String productId, 
      String productTmplId, 
      String productUomId, 
      String satuan,
      String satuanStock,
      String price, 
      int qty
    )async {
      // print('uom' + productUomId);
      String api_cart_product = ApiUrl.apiUrl + 'ecom/cart';
        try {
          isLoading(true);
           showProgressDialog();
          final response = await http.post(
            Uri.parse(api_cart_product),
            headers: {
              'Authorization': 'Bearer ${await loginController.getToken()}',
                'Content-Type': 'application/json',
            },
            body: jsonEncode(<String, String>{
              'product_id': productId,
              'product_tmpl_id': productTmplId,
              'product_uom_id': productUomId,
              'satuan': satuan,
              'satuan_stock': satuanStock,
              'price' : price,
              'quantity': qty.toString(),
            }),
          );
          // print(response.body);
  
          if(response.statusCode == 200){
             
            isLoading(false);
            // ignore: unused_local_variable
            var jsonResult = json.decode(response.body);
            await fetchCartProduct().then((value){
              closeProgressDialog();
              Get.toNamed(
                 RoutesName.cartProduct
              );
            });
            mainHeaderController.getCartCount();
            // update();
          }else{
            isLoading(false);
            closeProgressDialog();
            throw Exception(jsonDecode(response.body)['message']);
          }
        } catch (e) {
          isLoading(false);
          print(e.toString());

          // get.snackbar
          errorMessage(e.toString());
          // await Get.offAllNamed(RoutesName.loginCustomer);
        }finally{
          isLoading(false);
        }
    }
    

    Future<void> getCheckout() async {
    String api_get_checkout = ApiUrl.apiUrl + 'ecom/buy-now';

    try {
      isLoading(true);
      final response = await http.get(Uri.parse(api_get_checkout),
        headers: {
          'Authorization': 'Bearer ${await loginController.getToken()}',
        },
      );

      if(response.statusCode == 200){
        print(response.body);
        // print('Get Checkout sukses');
        final data = jsonDecode(response.body);
        checkoutResponse.value = CheckoutResult.fromJson(data);
        print(checkoutResponse.value);
      }else{
        // print('Get Checkout gagal');
        throw Exception('Failed to load data');
      }

    } catch (e) {
      // print('Get Checkout gagal');
      print("ini" + e.toString());
      isLoading(false);
    } finally{
      isLoading(false);
    }
  }

  // filter List CartProduct isSelected samadengan true maka jumlah semua quantity*harga
  void getTotalPrice(){
    int total = 0;
    for(var i = 0; i < cartProductList.length; i++){
      if(cartProductList[i].isSelected == true){
        total += int.parse(cartProductList[i].quantity!) * int.parse(cartProductList[i].price!);
      }
    }
    total_bayar.value = total;
    // print(total_bayar.value);
  }
  

    Future<void> checkoutProductCart(List<CartProduct> cartProductList)async {
      String api_cart_product = ApiUrl.apiUrl + 'ecom/checkout';
      var body = {};
        try {
          isLoading(true);
          for (var i = 0; i < cartProductList.length; i++) {
              String cartId = cartProductList[i].uuid!;
              body['cart_uuid[$i]'] = cartId;
          }
            final response = await http.post(Uri.parse(api_cart_product),
              headers: {
                'Authorization': 'Bearer ${await loginController.getToken()}',
              },
              body: body
            );
            print(response.statusCode);
            if(response.statusCode == 200){
              isLoading(false);
              var jsonResult = json.decode(response.body);
              print('Checkout Sukses');
              print(jsonResult);
            }else{
              isLoading(false);
              throw Exception(jsonDecode(response.body)['message']);
            }
          
        } catch (e) {
          isLoading(false);
          print(e.toString());
        }finally{
          isLoading(false);
        }
    }

    Future<void> addCartQuantity(String productId, String price, int qty)async {
      String api_cart_product = ApiUrl.apiUrl + 'ecom/cart';
        try {
          // isLoading(true);
          final response = await http.post(
            Uri.parse(api_cart_product),
            headers: {
              'Authorization': 'Bearer ${await loginController.getToken()}',
                'Content-Type': 'application/json',
            },
            body: jsonEncode(<String, String>{
              'product_id': productId,
              'price' : price,
              'quantity': qty.toString(),
            }),
          );

          // print(response.body);
  
          if(response.statusCode == 200){
            isLoading(false);
            var jsonResult = json.decode(response.body);
            print(jsonResult['message']);
            fetchCartProduct();
          }else{
            isLoading(false);
            throw Exception(jsonDecode(response.body)['message']);
          }
        } catch (e) {
          isLoading(false);
          print(e.toString());

          // get.snackbar
          errorMessage(e.toString());
        }finally{
          isLoading(false);
        }
    }

    Future<void> updateCartProduct(
      String uuid, 
      String productId,
      String productTmplid, 
      String productUomId, 
      String satuan, 
      String satuanStock, 
      String price, 
      int quantity)async {
      String api_cart_product = ApiUrl.apiUrl + 'ecom/cart/${uuid}';
        try {
          // isLoading(true);
          final response = await http.put(
            Uri.parse(api_cart_product),
            headers: {
              'Authorization': 'Bearer ${await loginController.getToken()}',
                'Content-Type': 'application/json',
            },
            body: jsonEncode(<String, String>{
              'product_id': productId,
              'product_tmpl_id': productTmplid,
              'product_uom_id': productUomId,
              'satuan': satuan,
              'satuan_stock': satuanStock,
              'price' : price,
              'quantity': quantity.toString(),
            }),
          );

          // print(response.body);
  
          if(response.statusCode == 200){
            isLoading(false);
            var jsonResult = json.decode(response.body);
            print(jsonResult['message']);
            isAllSelected.value = false;
            getTotalPrice();
            fetchCartProduct();
            update();
          }else{
            isLoading(false);
            throw Exception(jsonDecode(response.body)['message']);
          }
        } catch (e) {
          isLoading(false);
          print(e.toString());

          // get.snackbar
          errorMessage(e.toString());
        }finally{
          isLoading(false);
        }
    }

    Future<void> updateCart(
      String uuid, 
      String productId,
      String productTmplid, 
      String productUomId, 
      String satuan, 
      String satuanStock, 
      String price, 
      int quantity)async {
      String api_cart_product = ApiUrl.apiUrl + 'ecom/cart/${uuid}';
        try {
          // isLoading(true);
          final response = await http.put(
            Uri.parse(api_cart_product),
            headers: {
              'Authorization': 'Bearer ${await loginController.getToken()}',
                'Content-Type': 'application/json',
            },
            body: jsonEncode(<String, String>{
              'product_id': productId,
              'product_tmpl_id': productTmplid,
              'product_uom_id': productUomId,
              'satuan': satuan,
              'satuan_stock': satuanStock,
              'price' : price,
              'quantity': quantity.toString(),
            }),
          );

          // print(response.body);
  
          if(response.statusCode == 200){
            isLoading(false);
            var jsonResult = json.decode(response.body);
            print(jsonResult['message']);
            isAllSelected.value = false;
          }else{
            isLoading(false);
            throw Exception(jsonDecode(response.body)['message']);
          }
        } catch (e) {
          isLoading(false);
          print(e.toString());

          // get.snackbar
          errorMessage(e.toString());
        }finally{
          isLoading(false);
        }
    }

    Future<void> updateCartProductLoading(String uuid, String productId, String price, int quantity)async {
      String api_cart_product = ApiUrl.apiUrl + 'ecom/cart/${uuid}';
        try {
          // showProgressDialog();
          // isLoading(true);
          final response = await http.put(
            Uri.parse(api_cart_product),
            headers: {
              'Authorization': 'Bearer ${await loginController.getToken()}',
                'Content-Type': 'application/json',
            },
            body: jsonEncode(<String, String>{
              'product_id': productId,
              'price' : price,
              'quantity': quantity.toString(),
            }),
          );
          // closeProgressDialog();
          // print(response.body);
  
          if(response.statusCode == 200){
            isLoading(false);
            var jsonResult = json.decode(response.body);
            print(jsonResult['message']);
            isAllSelected.value = false;
            fetchCartProduct();
            update();
          }else{
            isLoading(false);
            throw Exception(jsonDecode(response.body)['message']);
          }
        } catch (e) {
          isLoading(false);
          print(e.toString());

          // get.snackbar
          errorMessage(e.toString());
        }finally{
          isLoading(false);
        }
    }



Future<void> deleteCartProduct(String uuid) async {
  String api_cart_product = ApiUrl.apiUrl + 'ecom/cart/' + uuid;
  
  try {
    // isLoading(true);
    showProgressDialog();

    final response = await http.delete(
      Uri.parse(api_cart_product),
      headers: {
        'Authorization': 'Bearer ${await loginController.getToken()}',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      isLoading(false);
      var jsonResult = json.decode(response.body);
      print(jsonResult['message']);
      await fetchCartProduct();
       closeProgressDialog();
      mainHeaderController.getCartCount();
      update(['${uuid}']);
    } else {
      isLoading(false);
      closeProgressDialog();
      throw Exception(jsonDecode(response.body)['message']);
    }
  } catch (e) {
    isLoading(false);
    print(e.toString());
    errorMessage(e.toString());
  } finally {
    isLoading(false);
  }
}


  Future<void> checkPrice(String? product_tmpl_id, int quantity) async{
    String api_checkprice = ApiUrl.apiUrl + 'ecom/data-master/check-price?product_tmpl_id=${product_tmpl_id}&quantity=${quantity}';

    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse(api_checkprice),
        headers: {
          'Authorization': 'Bearer ${await loginController.getToken()}',
        },
      );

      if(response.statusCode == 200){
        isLoading(false);
        final data = jsonDecode(response.body)['data'];
        final price = data['price'];
        final totalPrice = data['total_price'];
        prices[product_tmpl_id!] = price; // Simpan price dengan ID yang sesuai
        totalPrices[product_tmpl_id] = totalPrice; // Simpan totalPrice dengan ID yang sesuai
        print('ini price' + prices[product_tmpl_id]!);
      }else{
        isLoading(false);
        throw Exception('Failed to load data');
      }
    } catch (e) {
      isLoading(false);
      print(e);
    }finally{
      isLoading(false);
    }
  }


    
  void increment(
    String uuid, 
    RxInt quantity, 
    String stock, 
    int index, 
    String price,
    String productTmplid,
    String productUomId, 
    String satuan, 
    String satuanStock, 
    String productId, 
    RxInt totalCart){
    if(quantity.value < int.parse(stock)){
      //  updateCartProduct(uuid, productId, price, quantity.value + 1);
      quantity.value++;
       totalCart.value = 0;
       cartProductList[index].quantity = quantity.value.toString();
      Future.delayed(Duration(seconds: 3), () {
        updateCart(uuid, productId,productTmplid, productUomId, satuan, satuanStock, price, quantity.value);
      });
     
    }
    update(
        [index]
    );
  }

  void decrement(
    String uuid,
    String productTmplid, 
    String productId, 
    String productUomId,
    String satuan,
    String satuanStock,
    RxInt quantity, 
    String stock, 
    int index, 
    String price, 
    RxInt totalCart){
    if(quantity.value > 1){
      // updateCartProduct(uuid, productId, price, quantity.value - 1);
      quantity.value--;
      totalCart.value = 0;
      cartProductList[index].quantity = quantity.value.toString();
      Future.delayed(Duration(seconds: 3), () {
        updateCart(uuid, productId,productTmplid, productUomId, satuan, satuanStock, price, quantity.value);
      });
      
    }
     update(
        [index]
     );
  }

  void selectAll(String? isSelectAll) {
    isAllSelected.value = !isAllSelected.value;
    
    cartProductList.forEach((cartProduct) {
      cartProduct.isSelected = isAllSelected.value;
      // jumlah semua harga x quantity
      selectCartAll(isAllSelected.value.toString());
      update([
        '${cartProduct.uuid}'
      ]);
    });
    
  }

  void selectCartProduct(int index, RxInt quantity, String uuid){
    cartProductList[index].isSelected = !cartProductList[index].isSelected;
    // quantity ketika dichecklist masih sama quantity seperti sebelumnya berdasarkan uuid
    quantity.value = cartProductList[index].isSelected ? quantity.value : quantityGlobal.value;
    
    quantityGlobal.value = int.parse(cartProductList[index].quantity!);
    isAllSelected.value = cartProductList.every((cartProduct) => cartProduct.isSelected);
    // update();
    update(
      ['${uuid}']
    );
  }

  Future<void> selectCartProductCheckbox(int index,String uuid) async{
    cartProductList[index].isSelected = !cartProductList[index].isSelected;
    isAllSelected.value = cartProductList.every((cartProduct) => cartProduct.isSelected);
    // update();
    // fetchCartProductNoLoading();
    update(
      ['${uuid}']
    );
  }

  Future<void> selectCartProductCheckboxFalse(int index,String uuid) async{
    cartProductList[index].isSelected = false;
    // update();
    // fetchCartProductNoLoading();
    update(
      ['${uuid}']
    );
  }

  // function error message
  void errorMessage(String message){
    Get.snackbar(
      'Gagal',
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  // calculate totalprice dimana cartProductList dimana isSelected samadengan true
  void calculateTotalPrice() {
    int totalPrice = 0;
    for (var cartProduct in cartProductList) {
      if (cartProduct.isSelected) {
        int quantity = int.parse(cartProduct.quantity!);
        int price = int.parse(cartProduct.price!);
        totalPrice += quantity * price;
      }
    }
    total_bayar.value = totalPrice; // Update the reactive value
  }

  // calculate sisa stock dimana cartProductList[index].product.stock -  RxInt quantity,
  void calculateRemainingStock(int index, int satuanStock, RxInt quantity) {
  if (index >= 0 && index < cartProductList.length) {
    CartProduct cartProduct = cartProductList[index];
    int currentStock = int.parse(cartProduct.product!.stock!);
    int selectedQuantity = quantity.value; // Get the value from RxInt
    int remainingStock = currentStock - (selectedQuantity * satuanStock);

    cartProduct.sisaStock = remainingStock;

    cartProductList.refresh();
    
  }
}


  
  
}