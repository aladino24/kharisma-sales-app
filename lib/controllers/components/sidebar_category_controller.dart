

import 'package:get/get.dart';

class SidebarCategoryController extends GetxController{
   var variantHarga = ''.obs;
   var variantPublished = ''.obs;

   void setVariantHarga(String variantHarga) {
      if (this.variantHarga.value == variantHarga) {
        this.variantHarga.value = '';
      } else {
        this.variantHarga.value = variantHarga;
      }
      update();
   }

    void setVariantPublished(String variantPublished) {
        this.variantPublished.value = variantPublished;
        update();
    }
}