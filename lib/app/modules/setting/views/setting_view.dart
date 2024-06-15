import 'package:VEC_dickyderiyanto/app/routes/app_pages.dart';
import 'package:VEC_dickyderiyanto/constant/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SettingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('SettingView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(
                maxHeight: 110.0,
              ),
              width: MediaQuery.of(context).size.width,
              color: Colors.blueGrey[800],
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        NetworkImage("https://i.ibb.co/PGv8ZzG/me.jpg"),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hello",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                          ),
                        ),
                        Text(
                          "Driver Cahya",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "driver-cahya.jessindo.com",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 16.0,
                      backgroundColor: Colors.blueGrey[900],
                      child: const Icon(
                        Icons.edit,
                        size: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 20.0,
                top: 20.0,
                right: 20.0,
                bottom: 0.0,
              ),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Icon(Icons.store_sharp),
                            Text(
                              "25",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Total Toko",
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Icon(Icons.store_mall_directory_sharp),
                            Text(
                              "10",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Toko Dikunjungi",
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
            Card(
              child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          controller.downloadFile();
                        },
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          size: 14,
                          color: AppColors.appWave1,
                        ),
                        label: const Text(
                          "Download",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.appWave1,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Get.toNamed(Routes.WEBVIEW_PAGE);
                        },
                        icon: const Icon(
                          Icons.logout_sharp,
                          size: 14,
                          color: AppColors.appWave1,
                        ),
                        label: const Text(
                          "Open Webpage",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.appWave1,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // AuthLocalDatasource().removeAuthData();
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const LoginPage(),
                          //   ),
                          // );
                        },
                        icon: const Icon(
                          Icons.logout_sharp,
                          size: 14,
                          color: AppColors.appWave1,
                        ),
                        label: const Text(
                          "Logout",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.appWave1,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
