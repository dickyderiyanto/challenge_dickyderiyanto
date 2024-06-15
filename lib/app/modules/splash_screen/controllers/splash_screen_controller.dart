import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../components/custom_bottom_navbar.dart';
import '../../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  final count = 0.obs;
  Future<void> auth() async {
    final storage = GetStorage();
    bool isLoggedIn = storage.read("isLoggedIn") ?? false;
    final token = storage.read("token");
    // final auditCode = sharedPref.getStringPref("audit_code");
    // ignore: unrelated_type_equality_checks

    if (token != "" && isLoggedIn == true) {
      Get.offAll(() => const CustomBottomNavbar());
      // ignore: unrelated_type_equality_checks
      print(token);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
    @override
    void onInit() async {
      super.onInit();
    }
  }
}
