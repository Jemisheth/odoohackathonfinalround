// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


import '../utils/constant.dart';
import 'general_controller.dart';

class CartController extends GetxController {
  var isLoading = false.obs;

  Future<void> addToCart(String productId) async {
    isLoading.value = true;
    try {
      final response = await http.put(
        Uri.parse('${baseUrl}/api/v1/cart/add'),
        body: json.encode({'productId': productId}),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${generalConfigController.box.read('token')}'
        },
      );

      if (response.statusCode == 200) {
        // Handle success
        Get.snackbar('Success', 'Product added to cart');
        print('success');
      } else {
        // Handle error
        Get.snackbar('Error', 'Failed to add product to cart');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading.value = false;
    }
  }
}
