import 'package:get/get.dart';

class DetailProductController extends GetxController{

  var quantity = 1.obs;
  var variant = ''.obs;


  void increment(int value, String? stock){
    if(quantity < int.parse(stock!)){
      quantity.value++;
    }
    update();
  }

  void decrement(){
    if(quantity.value > 1){
      quantity.value--;
    }
    update();
  }

  void setVariant(String variant){
    this.variant.value = variant;
    update();
  }


}