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

  Map<String, dynamic>? categorySchemes;

  void clearAllscheme() {
    categorySchemes?.clear();
  }

  Future<void> fetchCategory() async {
    isLoading.value = true;
    try {
      var response = await http.get(
        Uri.parse(''), // add api link
        headers: {
          'Authorization': 'Bearer ${generalConfigController.box.read('token')}'
        },
      );
      categorySchemes = jsonDecode(response.body);

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
      categorySchemes = jsonDecode(response.body);

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
