// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'general_controller.dart';

class GetuserController extends GetxController {
  var isLoading = false.obs;

  Map<String, dynamic>? userProfile;

  Future<void> fetchUserProfile() async {
    isLoading.value = true;
    try {
      var res = await http.get(Uri.parse(''), headers: {
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
