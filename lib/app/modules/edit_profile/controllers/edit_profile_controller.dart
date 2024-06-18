import 'package:VEC_dickyderiyanto/app/modules/setting/controllers/setting_controller.dart';
import 'package:VEC_dickyderiyanto/components/custom_bottom_navbar.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../constant/variables.dart';
import '../../../data/models/user_profile.dart';

class EditProfileController extends GetxController {
  SettingController settingController = SettingController();
  final storage = GetStorage();
  final dio.Dio dioInstance = dio.Dio();

  void updateUserProfile(UserProfile userProfile) async {
    try {
      String token = storage.read('token');
      dioInstance.options.headers['Authorization'] = 'Bearer $token';

      dio.FormData formData = dio.FormData.fromMap(userProfile.toMap());

      var response = await dioInstance.post(
        '${Variables.baseUrl}/user/profile',
        data: formData,
        options: dio.Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Profile updated successfully');
        Get.offAll(const CustomBottomNavbar());
      } else {
        Get.snackbar('Error', 'Failed to update profile');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update profile: $e');
    }
  }

  bool validateInputs(UserProfile userProfile) {
    if (userProfile.name.isEmpty) {
      Get.snackbar('Error', 'Name cannot be empty');
      return false;
    }
    if (userProfile.email.isEmpty || !GetUtils.isEmail(userProfile.email)) {
      Get.snackbar('Error', 'Invalid email');
      return false;
    }
    if (userProfile.height < 0 || userProfile.weight < 0) {
      Get.snackbar('Error', 'Height and weight must be greater than 0');
      return false;
    }
    return true;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    settingController.fetchUserProfile();
    super.onInit();
  }
}
