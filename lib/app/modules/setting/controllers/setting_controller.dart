import 'dart:convert';
import 'dart:io';

import 'package:VEC_dickyderiyanto/constant/variables.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/datasource/api_service.dart';
import '../../../data/models/user_model.dart';
import '../../../data/models/user_profile.dart';

class SettingController extends GetxController {
  late TargetPlatform? platform;
  Rx<User?> user = Rx<User?>(null);

  void logout() {
    APIService authRemoteDatasource = APIService();
    Get.dialog(AlertDialog(
      title: const Text('Confirm Logout'),
      content: const Text("Are you sure want to logout ?"),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () async {
            Get.back();
            await authRemoteDatasource.logout();
          },
          child: const Text("Confirm"),
        ),
      ],
    ));
  }

  void fetchUserProfile() async {
    final storage = GetStorage();
    final token = storage.read("token");
    try {
      var response = await Dio().get('${Variables.baseUrl}/user',
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));

      var data = response.data;
      // Pastikan data adalah Map<String, dynamic>
      if (data is Map<String, dynamic>) {
        print(data);
        user.value = User.fromMap(data);
        print(user.value);
      } else {
        print('Error: Data is not a Map<String, dynamic>');
      }
    } catch (e) {
      print('Error fetching user profile: $e');
      // Handle error here
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    if (Platform.isAndroid) {
      platform = TargetPlatform.android;
    } else {
      platform = TargetPlatform.iOS;
    }
    fetchUserProfile();
    super.onInit();
  }
}
