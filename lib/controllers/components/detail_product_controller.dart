import 'package:get/get.dart';

import '../../models/product.dart';

class DetailProductController extends GetxController{
  final Product? product;

  DetailProductController({required this.product});

  var quantity = 1.obs;
  var variant = ''.obs;
  var price = ''.obs;
  var totalStock = 0.obs;

// init variant
  @override
  void onInit() {
    super.onInit();
    variant.value = product!.productUom![0].label!;
    price.value = product!.productUom![0].productPricelist![0].price!;
  }

void setProductStock(Product product) {
   final ProductUom? selectedVariant = variant.value != '' ?
                                          product.productUom!.firstWhere(
                                                  (uom) => uom.label == variant.value) : 
                                                  product.productUom!.firstWhere((uom) => uom.label == product.productUom![0].label);
    // Set the initial total stock
    if(variant.value.isEmpty){
      totalStock.value = int.parse(product.stock!) - int.parse(product.productUom![0].stock!);
    }else{
      totalStock.value = int.parse(product.stock!) - int.parse(selectedVariant!.stock!) * quantity.value;
    }
    update();
  }

  void increment(int value, String? stock){
    if(quantity < int.parse(stock!)){
      quantity.value++;
       updateTotalStock();
    }
    update();
  }

  void decrement(){
    if(quantity.value > 1){
      quantity.value--;
      updateTotalStock();
    }
    update();
  }

  void setVariant(String variant, String price){
    this.variant.value = variant;
    this.price.value = price;
    setProductStock(product!);
    update();
  }

  void updateTotalStock() {
    if (variant.value.isNotEmpty) {
      // Calculate the new total stock by multiplying the quantity with the selected variant's stock
      final ProductUom? selectedVariant = variant.value != '' ?
                                          product!.productUom!.firstWhere(
                                                  (uom) => uom.label == variant.value) : 
                                                  product!.productUom!.firstWhere((uom) => uom.label == product!.productUom![0].label);
      if (selectedVariant != null) {
        totalStock.value = int.parse(product!.stock!) - int.parse(selectedVariant.stock!) * quantity.value;
        update();
      }else{
        totalStock.value = int.parse(product!.stock!) - int.parse(product!.productUom![0].stock!) * quantity.value;
        update();
      }
    }else{
      totalStock.value = int.parse(product!.stock!) - int.parse(product!.productUom![0].stock!) * quantity.value;
      update();
    }
  }


}