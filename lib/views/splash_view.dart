import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/general_controller.dart';
import '../routes/app_routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      generalConfigController.dheight = MediaQuery.of(context).size.height;
      generalConfigController.dwidth = MediaQuery.of(context).size.width;
      Get.offAllNamed(Routes.HOME);
      // generalConfigController.box.hasData('token')
      //     ? Get.offAllNamed(Routes.HOME)
      //     : Get.toNamed(Routes.LOGIN);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/logo.png',
            ),
          ),
        ),
      ),
    );
  }
}
