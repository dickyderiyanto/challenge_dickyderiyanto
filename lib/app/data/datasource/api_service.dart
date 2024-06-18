import 'dart:io';
import 'package:flutter/material.dart';
import 'package:VEC_dickyderiyanto/app/modules/login/views/login_view.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../constant/variables.dart';
import '../models/login_model.dart';

class APIService {
  late String _localPath;
  late bool permissionReady;
  late TargetPlatform? platform;
  Future<LoginModel> login(LoginRequestModel loginRequestModel) async {
    String url = "${Variables.baseUrl}/sign-in";
    try {
      final response = await Dio().post(url, data: loginRequestModel.toJson());
      if (response.statusCode == 200) {
        return LoginModel.fromMap(response.data);
      } else {
        throw Exception(response.data['message'] ?? 'Failed to load data');
      }
      // ignore: deprecated_member_use
    } on DioError catch (dioError) {
      String errorMessage =
          dioError.response?.data['message'] ?? dioError.message;
      Get.snackbar("Login Failed", errorMessage);
      throw Exception(errorMessage);
    } catch (e) {
      Get.snackbar("Login Failed", e.toString());
      throw Exception('Failed to load data');
    }
  }

  Future<void> logout() async {
    String url = "${Variables.baseUrl}/sign-out";
    final storage = GetStorage();
    final token = storage.read('token');

    final response = await Dio().post(
      url,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode == 200) {
      storage.remove('token');
      storage.write('isLoggedIn', false);
      Get.offAll(() => const LoginView());
    } else {
      Get.snackbar('Error', response.statusMessage.toString());
      throw Exception('Failed to logout');
    }
  }

  Future<void> downloadFile() async {
    Dio dio = Dio();

    // Meminta izin penyimpanan
    var status = await Permission.storage.request();
    if (status.isPermanentlyDenied) {
      // Tampilkan dialog untuk mengarahkan pengguna ke pengaturan
      openAppSettings();
      return;
    } else if (!status.isGranted) {
      Get.snackbar('Error', 'Storage permission denied');
      return;
    }

    try {
      // Mendapatkan direktori eksternal untuk penyimpanan
      Directory? dir = await getExternalStorageDirectory();
      if (dir == null) {
        Get.snackbar('Error', 'Failed to get directory');
        return;
      }

      String savePath = '${dir.path}/flutter_tutorial.pdf';

      await dio.download(
        'https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf',
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            print((received / total * 100).toStringAsFixed(0) + "%");
          }
        },
      );

      Get.snackbar('Success', 'File downloaded to $savePath');
    } catch (e) {
      Get.snackbar('Error', 'Failed to download file: $e');
    }
  }
}
