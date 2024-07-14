// ignore_for_file: avoid_print, await_only_futures

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/color.dart';
import '../utils/constant.dart';
import 'general_controller.dart';
import 'package:http/http.dart' as http;

class CreatepaymentController extends GetxController {
  var isLoading = false.obs;

  Future<void> launchUrl1(Uri uri, bool inApp) async {
    try {
      if (await canLaunchUrl(uri)) {
        if (inApp) {
          await launchUrl(uri, mode: LaunchMode.inAppWebView);
        } else {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> createPayment() async {
    String url =
        '$baseUrl/api/v1/payment/${generalConfigController.box.read('userID')}';
    isLoading.value = true;
    try {
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode({}),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${generalConfigController.box.read('token')}'
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print('success');
        String link = data['paymentLinkUrl'];
        print(link);
        generalConfigController.box.write('link', link);
        launchUrl1(Uri.parse(link), true);
      }
    } catch (error) {
      print('Error: $error');
      // Get.toNamed(Routes.HOME);
    } finally {
      isLoading.value = false;
    }
  }
}
