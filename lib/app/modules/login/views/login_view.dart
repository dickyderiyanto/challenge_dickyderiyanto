// ignore_for_file: avoid_print
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../components/clippers.dart';
import '../../../../constant/colors.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: WaveClipper2(),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [AppColors.appWave2, AppColors.appWave22])),
                  child: const Column(),
                ),
              ),
              ClipPath(
                clipper: WaveClipper3(),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [AppColors.appWave3, AppColors.appWave33])),
                  child: const Column(),
                ),
              ),
              ClipPath(
                clipper: WaveClipper1(),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [AppColors.appWave1, AppColors.appWave11])),
                  child: const Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Welcome Back!",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 30),
                      ),
                      Text(
                        "to Challenge Apps",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            width: 120,
            child: Image.asset(
              "assets/images/Logo.png",
              width: 120,
              height: 120,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text("Please Sign In"),
          ),
          Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(26),
                child: Column(
                  children: [
                    IntlPhoneField(
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          // borderSide: BorderSide(),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                      initialCountryCode: 'ID',
                      onChanged: (phone) {
                        String countryCodeWithoutPlus =
                            phone.countryCode.replaceAll('+', '');
                        if (!RegExp(r'^[1-9][0-9]*$').hasMatch(phone.number)) {
                          Get.snackbar(
                            'Invalid Phone Number',
                            'Phone number must only contain numbers (0-9) and cannot start with 0.',
                            snackPosition: SnackPosition.BOTTOM,
                          );
                          // Clear the invalid phone number
                          phone.number = '';
                        } else {
                          controller.phoneNumber.value = phone.number;
                          controller.countryCode.value = countryCodeWithoutPlus;
                        }
                        print(controller.phoneNumber.value);
                        print(controller.countryCode.value);
                      },
                    ),
                    Material(
                      elevation: 2.0,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      child: TextField(
                        controller: controller.passContr,
                        onChanged: (String value) {},
                        obscureText: !controller.isShowPassword.value,
                        cursorColor: AppColors.appOrange,
                        decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                controller.passwordVisibilty();
                              },
                              child: Icon(controller.isShowPassword.value
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            prefixIcon: const Material(
                              elevation: 0,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              child: Icon(
                                Icons.lock,
                                color: AppColors.appRed,
                              ),
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 13)),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Obx(() {
                      return controller.errorMessage.value.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                controller.errorMessage.value,
                                style: const TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            )
                          : const SizedBox.shrink();
                    }),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Container(
                        width: double.infinity, // Lebar penuh
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            color: AppColors.appWave1),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.appWave1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                          ),
                          onPressed: () {
                            controller.doLogin();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
