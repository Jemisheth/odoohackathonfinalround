// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';
import '../utils/constant.dart';
import 'package:http/http.dart' as http;

import 'general_controller.dart';

class CreateorderController extends GetxController {
  var isLoading = false.obs;

  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  Future<void> createOrder() async {
    const url = '${baseUrl}/api/v1/order/';
    isLoading = true.obs;
    try {
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          'street': streetController.text,
          'city': cityController.text,
          'state': stateController.text,
          'pincode': pincodeController.text,
          'mobile': mobileController.text,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${generalConfigController.box.read('token')}'
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        String user = data['_id'];

        print(user);

        generalConfigController.box.write('userID', user);

        Get.offAllNamed(Routes.HOME);
      }
    } catch (error) {
      print('Error: $error');
      // Get.toNamed(Routes.HOME) ;
    } finally {
      isLoading.value = false;
    }
  }
}
