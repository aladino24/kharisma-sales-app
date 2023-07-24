import 'package:get/get.dart';
import 'package:kharisma_sales_app/controllers/components/main_header_controller.dart';

class MainHeaderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainHeaderController>(() => MainHeaderController());
  }
}