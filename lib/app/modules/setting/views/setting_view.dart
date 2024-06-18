import 'package:VEC_dickyderiyanto/app/data/datasource/api_service.dart';
import 'package:VEC_dickyderiyanto/app/data/datasource/check_response_datasource.dart';
import 'package:VEC_dickyderiyanto/app/routes/app_pages.dart';
import 'package:VEC_dickyderiyanto/constant/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  final APIService dataSource = APIService();
  final CheckResponseDatasource response = CheckResponseDatasource();
  SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SettingController());
    controller.fetchUserProfile();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Obx(() {
              return controller.user.value == null
                  ? const Center(child: const CircularProgressIndicator())
                  : Container(
                      constraints: const BoxConstraints(
                        maxHeight: 110.0,
                      ),
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.appWave1,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                controller.user.value!.data.profilePicture),
                            child: controller
                                    .user.value!.data.profilePicture.isEmpty
                                ? Image.asset(
                                    "assets/images/default_profil.png")
                                : null,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Hello",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                  ),
                                ),
                                Text(
                                  controller.user.value!.data.name,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  controller.user.value!.data.email,
                                  style: const TextStyle(
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
                            onTap: () {
                              Get.toNamed(Routes.EDIT_PROFILE);
                            },
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
                    );
            }),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 80,
            ),
            Card(
              child: Container(
                color: AppColors.appWave1,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          await dataSource.downloadFile();
                        },
                        icon: const Icon(
                          Icons.download,
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
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Get.toNamed(Routes.WEBVIEW_PAGE);
                        },
                        icon: const Icon(
                          Icons.open_in_browser,
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
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          response.setupDioInterceptor();
                        },
                        icon: const Icon(
                          Icons.network_check,
                          size: 14,
                          color: AppColors.appWave1,
                        ),
                        label: const Text(
                          "Check Response",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.appWave1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          controller.logout();
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
