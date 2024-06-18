import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CheckResponseDatasource {
  void setupDioInterceptor() {
    Dio dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Add Bearer token header from local storage
        final storage = GetStorage();
        final token = storage.read('token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Check if response status code is 401 (Unauthorized)
        if (response.statusCode == 401) {
          // Remove token from local storage
          final storage = GetStorage();
          storage.remove('token');
          // Redirect user back to login page
          Get.offAllNamed('/login');
        } else {
          // For other status codes, show success snackbar
          Get.snackbar("Success", "Status response ok");
        }
        return handler.next(response); // Pass the response to next handler
      },
      onError: (DioException e, handler) async {
        // Handle other errors here if needed
        return handler.next(e);
      },
    ));
  }
}
