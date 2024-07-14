import 'package:get/get.dart';

import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'general_controller.dart';

class GetallControllerBook extends GetxController {
  var isLoading = false.obs;

  Map<String, dynamic>? userProfile;

  Future<void> fetchbooks() async {
    isLoading.value = true;
    try {
      var res = await http
          .get(Uri.parse('http://localhost:3001/api/v1/books/'), headers: {
        'Authorization': 'Bearer ${generalConfigController.box.read('token')}'
      });

      userProfile = jsonDecode(res.body);
      print('Response body: $userProfile');

      if (res.statusCode == 200) {
        print('success');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
