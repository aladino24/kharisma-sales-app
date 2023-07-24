import 'package:get/get.dart';

class GlobalData {
  static RxBool hasToken = false.obs;

  static void clearData() {
    hasToken(false);
  }
}