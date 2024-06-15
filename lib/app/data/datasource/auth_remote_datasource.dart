import 'package:dio/dio.dart';
import 'package:get/get.dart';
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
}
