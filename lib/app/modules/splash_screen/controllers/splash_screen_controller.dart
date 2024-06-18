import 'dart:async';
import 'dart:io';
import 'package:VEC_dickyderiyanto/app/data/datasource/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../components/custom_bottom_navbar.dart';
import '../../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  final storage = GetStorage();
  APIService apiService = APIService();

  Future<void> auth() async {
    bool isLoggedIn = storage.read(
          'isLoggedIn',
        ) ??
        false;
    final token = storage.read('token');
    if (token != "" && isLoggedIn == true) {
      Get.offAll(() => const CustomBottomNavbar());
      print(token);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
    @override
    void onInit() async {
      GetStorage.init();
      super.onInit();
      if (Platform.isAndroid) {
        apiService.platform = TargetPlatform.android;
      } else {
        apiService.platform = TargetPlatform.iOS;
      }
    }
  }
}
