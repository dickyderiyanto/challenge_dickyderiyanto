import 'package:VEC_dickyderiyanto/constant/variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import '../../../data/models/product_model.dart';

class HomeController extends GetxController {
  var products = <Products>[].obs;
  var isLoading = false.obs;
  var hasMore = true.obs;
  var skip = 10;
  final limit = 100;

  @override
  void onInit() {
    super.onInit();
    final storage = GetStorage();
    final token = storage.read("token");
    fetchProducts(token);
  }

  void fetchProducts(String token,
      {int limit = 100,
      int skip = 10,
      String sortOrder = 'desc',
      String sortColumn = 'created_at'}) async {
    if (isLoading.value || !hasMore.value) return;

    isLoading.value = true;
    try {
      Dio dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.get(
        '${Variables.baseUrl}/product',
        queryParameters: {
          'limit': limit,
          'skip': skip,
          'sort_order': sortOrder,
          'sort_column': sortColumn,
        },
      );

      if (response.statusCode == 200) {
        var responseData = response.data;
        if (responseData != null) {
          ProductModel productModel = ProductModel.fromMap(responseData);
          if (productModel.data.isEmpty) {
            hasMore.value = false;
            _showNoMoreDataDialog();
          } else {
            products.addAll(productModel.data);
            this.skip += productModel.data.length;
          }
        } else {
          hasMore.value = false;
          _showNoMoreDataDialog();
        }
      } else {
        hasMore.value = false;
        _showNoMoreDataDialog();
      }
    } catch (e) {
      print('Error fetching products: $e');
      hasMore.value = false;
      _showNoMoreDataDialog();
    } finally {
      isLoading.value = false;
    }
  }

  void _showNoMoreDataDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('No More Data'),
        content: const Text('All data has been loaded.'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void loadMore(String token) {
    if (hasMore.value && !isLoading.value) {
      fetchProducts(token, limit: limit, skip: skip);
    }
  }
}
