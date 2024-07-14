// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../routes/app_routes.dart';
import '../utils/constant.dart';
import 'general_controller.dart';

class SearchControllerList extends GetxController {
  var isLoading = false.obs;

  Rx<String> tag = "".obs;

  Map<String, dynamic>? searchBook;

  TextEditingController searchTextController = TextEditingController();

  Future<void> fetchsearchBook() async {
    isLoading.value = true;
    try {
      var response = await http.get(
        Uri.parse(
            '${baseUrl}/api/v1/product/category/search?category=${searchTextController.text}'),
        headers: {
          'Authorization': 'Bearer ${generalConfigController.box.read('token')}'
        },
      );
      searchBook = jsonDecode(response.body);

      // print('Response body: $allSchemes');
      if (response.statusCode == 200) {
        print('success');
        // Get.toNamed(Routes.SEARCHTEXT);
        searchTextController.clear();
        print('Response body: $searchBook');
        searchTextController.clear();
      }
      // }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
