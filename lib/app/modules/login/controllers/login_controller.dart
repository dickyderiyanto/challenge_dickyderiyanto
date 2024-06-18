import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../components/custom_bottom_navbar.dart';
import '../../../data/datasource/api_service.dart';
import '../../../data/models/login_model.dart';

class LoginController extends GetxController {
  TextEditingController passContr = TextEditingController();
  RxString phoneNumber = ''.obs;
  RxString countryCode = 'ID'.obs;
  RxString errorMessage = ''.obs;
  RxBool isLoading = false.obs;
  final isShowPassword = false.obs;

  passwordVisibilty() {
    isShowPassword.value = !isShowPassword.value;
  }

  void doLogin() async {
    if (passContr.text.length < 8) {
      errorMessage.value = 'Password must be at leats 8 character';
    }
    APIService authRemoteDataSource = APIService();
    isLoading.value = true;
    final storage = GetStorage();

    try {
      final value = await authRemoteDataSource.login(
        LoginRequestModel(
          phoneNumber: phoneNumber.value,
          password: passContr.text,
          countryCode: countryCode.value,
        ),
      );
      // ignore: unnecessary_null_comparison
      if (value != null) {
        storage.write('token', value.data.token.toString());
        storage.write('isLoggedIn', true);
        Get.snackbar('Success', 'Login Successful');
        Get.offAll(() => const CustomBottomNavbar());
        print(value.data);
      }
    } catch (e) {
      passContr.clear();
      // Get.snackbar("Error", "Login Failed: $e");
    } finally {
      isLoading.value = false; // Set loading state to false
    }
  }
}
