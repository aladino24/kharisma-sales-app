

import 'package:get/get.dart';

class SidebarCategoryController extends GetxController{
   var variantHarga = ''.obs;
   var variantPublished = ''.obs;

   void setVariantHarga(String variantHarga) {
      this.variantHarga.value = variantHarga;
      update();
   }

    void setVariantPublished(String variantPublished) {
        this.variantPublished.value = variantPublished;
        update();
    }
}