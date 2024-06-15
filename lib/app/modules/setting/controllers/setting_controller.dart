import 'package:VEC_dickyderiyanto/app/data/datasource/auth_remote_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class SettingController extends GetxController {
  Future<void> downloadFile() async {
    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();
      String savePath = '${dir.path}/flutter_tutorial.pdf';

      await dio.download(
          'https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf',
          savePath, onReceiveProgress: (received, total) {
        if (total != -1) {
          print((received / total * 100).toStringAsFixed(0) + "%");
        }
      });
      Get.snackbar('Success', 'File downloaded to $savePath');
    } catch (e) {
      Get.snackbar('Error', 'Failed to download file');
    }
  }

  void logout() {
    AuthRemoteDatasource authRemoteDatasource = AuthRemoteDatasource();
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
}
