import 'package:VEC_dickyderiyanto/app/modules/login/views/login_view.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../constant/variables.dart';
import '../models/login_model.dart';

class AuthRemoteDatasource {
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
}
