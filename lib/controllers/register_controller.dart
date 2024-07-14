// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../routes/app_routes.dart';
import '../utils/constant.dart';

class RegisterController extends GetxController {
  String R_username = "";
  String R_password = "";
  String R_email = "";
  String R_phone = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  RxBool obscureText = true.obs;

  void hidePass() {
    obscureText.value = !obscureText.value;
  }

  void showSnackbar(BuildContext context) {
    final snackbar = SnackBar(
      content: Text('Register Successful, Check your Mail to verify',
          style: GoogleFonts.aBeeZee(fontSize: 16)),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  Future<void> signUp() async {
    const url = ''; // add api link here

    try {
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          'firstName': nameController.text,
          'lastName': emailController.text,
          'email': emailController.text,
          'password': passwordController.text,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        print(data);
        print('Registration successful');
        Get.offAllNamed(Routes.HOME);
      } else {
        print('Error: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
