// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import '../utils/constant.dart';
import 'package:http/http.dart' as http;

import 'general_controller.dart';

class CreateissueController extends GetxController {
  var isLoading = false.obs;

  TextEditingController durationController = TextEditingController();

  Future<void> createOrder() async {
    const url = '${baseUrl}/api/v1/issue/new';
    isLoading = true.obs;
    try {
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          'book': generalConfigController.box.read('bookID').toString(),
          'volume': generalConfigController.box.read('volumeid').toString(),
          'duration': durationController.text,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${generalConfigController.box.read('token')}'
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);

        // Get.offAllNamed(Routes.HOME);
      }
    } catch (error) {
      print('Error: $error');
      // Get.toNamed(Routes.HOME) ;
    } finally {
      isLoading.value = false;
    }
  }
}
