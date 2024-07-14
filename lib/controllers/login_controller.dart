import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../routes/app_routes.dart';
import '../utils/constant.dart';
import 'general_controller.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  // String username = "";
  // String password = "";

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  RxBool obscureText = true.obs;

  void hidePass() {
    obscureText.value = !obscureText.value;
  }

  void showSnackbar(BuildContext context) {
    final snackbar = SnackBar(
      content:
          Text('Login Successful', style: GoogleFonts.aBeeZee(fontSize: 16)),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  Future<void> login() async {
    const url = '${baseUrl}/api/v1/auth/login';
    isLoading = true.obs;
    try {
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          'email': emailController.text,
          'password': passwordController.text,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        String jwtToken = data['jwt'];
        String role = data['userexist']['role'];
        print(jwtToken);
        print(role);

        generalConfigController.box.write('token', jwtToken);
        generalConfigController.box.write('role', role);

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
