import 'package:get/get.dart';
import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';

class NetworkController extends GetxController{
   

   var connectionStatus = 0.obs;
   final Connectivity _connectivity = Connectivity();
   late StreamSubscription<ConnectivityResult> _connectivitySubscription;

    @override
    void onInit() {
      super.onInit();
      initConnectivity();
      _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    }

    Future<void> initConnectivity() async {
       ConnectivityResult result = ConnectivityResult.none;

      try {
        result = await _connectivity.checkConnectivity();
      } on PlatformException catch (e) {
        print(e.toString());
      }

      return _updateConnectionStatus(result);
    }

    _updateConnectionStatus(ConnectivityResult result){
      switch(result){
        case ConnectivityResult.wifi:
          connectionStatus.value = 1;
          break;
        case ConnectivityResult.mobile:
          connectionStatus.value = 2;
          break;
        case ConnectivityResult.none:
          connectionStatus.value = 0;
          break;
        default:
          Get.snackbar("Network Error", "Gagal terhubung ke jaringan");
          break;
      }
    }


    @override
    void onClose() {
      
    }
}