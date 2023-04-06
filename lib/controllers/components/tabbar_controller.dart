import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTabController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void onInit() {
    _tabController = TabController(length: 4, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    _tabController.dispose();
    super.onClose();
  }

  TabController get tabController => _tabController;
}
