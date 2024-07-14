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
            '${baseUrl}/api/v1/books/search?search=${searchTextController.text}'),
        headers: {
          'Authorization': 'Bearer ${generalConfigController.box.read('token')}'
        },
      );
      searchBook = jsonDecode(response.body);

      // print('Response body: $allSchemes');
      if (response.statusCode == 200) {
        print('success');
        Get.toNamed(Routes.SEARCHBOOK);
        String bookid = searchBook!['books']['title'][0]['_id'].toString();
        String volumeId =
            searchBook!['books']['title'][0]['volumes'][0]['_id'].toString();
        print(volumeId.toString());
        generalConfigController.box.write('bookID', bookid);
        generalConfigController.box.write('volumeid', volumeId);
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
