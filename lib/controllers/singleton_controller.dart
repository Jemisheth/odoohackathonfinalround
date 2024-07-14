// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:odoohackathon1/controllers/category_controller.dart';
import 'package:odoohackathon1/controllers/getuser_controller.dart';

import 'createOrder_controller.dart';
import 'createpayment_controller.dart';
import 'login_controller.dart';
import 'register_controller.dart';
import 'search_controller.dart';


final getIt = GetIt.instance;

void singletonSetup() {
// controllers
  getIt.registerSingleton<LoginController>(LoginController());
  getIt.registerSingleton<RegisterController>(RegisterController());
  getIt.registerSingleton<CategoryController>(CategoryController());
  getIt.registerSingleton<GetuserController>(GetuserController());
  getIt.registerSingleton<SearchControllerList>(SearchControllerList());
  getIt.registerSingleton<CreatepaymentController>(CreatepaymentController());
  getIt.registerSingleton<CreateorderController>(CreateorderController());
  
}
