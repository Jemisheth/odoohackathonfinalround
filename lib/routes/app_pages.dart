// ignore_for_file: constant_identifier_names, unused_import

import 'package:get/get.dart';
import 'package:odoohackathon1/views/book/book_view.dart';
import 'package:odoohackathon1/views/categories/categories_view.dart';
import 'package:odoohackathon1/views/dashboard/home_view.dart';
import 'package:odoohackathon1/views/login/login_view.dart';
import 'package:odoohackathon1/views/order/createorder_view.dart';
import 'package:odoohackathon1/views/order/order_view.dart';
import 'package:odoohackathon1/views/search%20book/search_view.dart';

import '../views/login/register_view.dart';
import '../views/splash_view.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;
  static final routes = [
    GetPage(
      transition: Transition.rightToLeft,
      name: Routes.SPLASH,
      page: () => const SplashView(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: Routes.LOGIN,
      page: () => const LoginView(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: Routes.REGISTER,
      page: () => const RegisterView(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: Routes.HOME,
      page: () => const HomeView(),
    ),

    // categories

    GetPage(
      transition: Transition.rightToLeft,
      name: Routes.CATEGORIES,
      page: () => const CategoriesView(),
    ),

    // book

    // GetPage(
    //   transition: Transition.rightToLeft,
    //   name: Routes.BOOK,
    //   page: () => const BookView(),
    // ),

    // search 
    GetPage(
      transition: Transition.rightToLeft,
      name: Routes.SEARCHBOOK,
      page: () => const SearchView(),
    ),

    // order

    GetPage(
      transition: Transition.rightToLeft,
      name: Routes.ORDERVIEW,
      page: () => const UserOrderView(),
    ), 
    GetPage(
      transition: Transition.rightToLeft,
      name: Routes.CREATEORDERVIEW,
      page: () => const CreateOrderView(),
    ),

  ];
}
