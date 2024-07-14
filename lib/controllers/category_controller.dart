// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../routes/app_routes.dart';
import '../utils/constant.dart';
import 'general_controller.dart';

class CategoryController extends GetxController {
  var isLoading = false.obs;
  RxString tag = ''.obs;
  RxString cat = ''.obs;

  Map<String, dynamic>? categoryBook;

  void clearAllscheme() {
    categoryBook?.clear();
  }

  Future<void> fetchCategory() async {
    isLoading.value = true;
    try {
      var response = await http.get(
        Uri.parse('${baseUrl}/api/v1/books/search?search=${cat.value}'),
        headers: {
          'Authorization': 'Bearer ${generalConfigController.box.read('token')}'
        },
      );
      categoryBook = jsonDecode(response.body);

      // print('Response body: $allSchemes');
      if (response.statusCode == 200) {
        // allSchemes = jsonDecode(response.body);
        // print('Response body: $allSchemes');
        Get.toNamed(Routes.CVIEW);
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // particular product fetch

  Future<void> fetchproduct(String id) async {
    isLoading.value = true;
    try {
      var response = await http.get(
        Uri.parse('${baseUrl}api/v1/product/${id}'),
        headers: {
          'Authorization': 'Bearer ${generalConfigController.box.read('token')}'
        },
      );
      categoryBook = jsonDecode(response.body);

      // print('Response body: $allSchemes');
      if (response.statusCode == 200) {
        // allSchemes = jsonDecode(response.body);
        // print('Response body: $allSchemes');
        Get.toNamed(Routes.CATEGORIES);
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
