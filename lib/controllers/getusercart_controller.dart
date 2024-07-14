// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:get/get.dart';

import '../routes/app_routes.dart';
import '../utils/constant.dart';
import 'general_controller.dart';
import 'package:http/http.dart' as http;

class GetUserCart extends GetxController {
  var isLoading = false.obs;

  Map<String, dynamic>? userCart;

  Future<void> fetchUserCart() async {
    isLoading.value = true;
    try {
      var response = await http.get(
        Uri.parse('${baseUrl}/api/v1/cart/'),
        headers: {
          'Authorization': 'Bearer ${generalConfigController.box.read('token')}'
        },
      );
      userCart = jsonDecode(response.body);

      // print('Response body: $allSchemes');
      if (response.statusCode == 200) {
        // allSchemes = jsonDecode(response.body);
        print('Response body: $userCart');
        Get.toNamed(Routes.CARTPAGE);
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // delete cart api

  Future<void> deleteCartItem(int cartId) async {
    String apiUrl = '${baseUrl}/api/v1/cart/cartitem/$cartId';

    try {
      isLoading.value = true;

      final http.Response response = await http.delete(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Authorization':
              'Bearer ${generalConfigController.box.read('token')}',
        },
      );

      if (response.statusCode == 200) {
        print('DELETE request successful');
      } else {
        print('DELETE request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle errors
      print('Error during DELETE request: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
