import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odoohackathon1/controllers/category_controller.dart';
import 'package:odoohackathon1/controllers/singleton_controller.dart';
import 'package:odoohackathon1/utils/color.dart';

import '../../common/categories.dart';
import '../../controllers/general_controller.dart';
import '../../routes/app_routes.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {

  CategoryController categoryController = getIt.get<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: appbar,
        title: Text('Categories', style: GoogleFonts.aBeeZee(fontSize: 16),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // height: generalConfigController.dheight * .51,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: containerColor, borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Book Categories:',
                            style: GoogleFonts.aBeeZee(
                              fontSize: 20,
                              color: black,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Cards(
                              image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMistxXaRsqB0tfxtFwOWaQB4BX6OzqdN0mA&s',
                              text: 'Crime',
                              onTap: () {
                                categoryController.cat.value = 'crime';
                                // Get.toNamed(Routes.LIVING);
                              },
                            ),
                            Cards(
                              image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPBaQH0GKsvbKjJqwSgawRZ2h7I3RH139AJA&s',
                              text: 'Mystery',
                              onTap: () {
                                categoryController.cat.value = 'mystery';
                                // Get.toNamed(Routes.BED);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Cards(
                              image: 'https://rukminim2.flixcart.com/image/850/1000/xif0q/book/y/o/c/101-horror-books-to-read-before-you-re-murdered-original-imaghyfkqfvzuhgt.jpeg?q=90&crop=false',
                              text: 'Horror',
                              onTap: () {
                                categoryController.cat.value = 'horror';
                                // Get.toNamed(Routes.DINING);
                              },
                            ),
                            Cards(
                              image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB43phUZYEOFdldxpezCz0lnvR6lK3IA4aAA&s',
                              text: 'Fiction',
                              onTap: () {
                                categoryController.cat.value = 'fiction';
                                // Get.toNamed(Routes.OFFICE);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Cards(
                              image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg3w-KbsjA7yNn4Etz0iCWv3N_1BjcmljowQ&s',
                              text: 'History',
                              onTap: () {
                                categoryController.cat.value = 'history';
                                // Get.toNamed(Routes.DINING);
                              },
                            ),
                            Cards(
                              image: 'https://www.bookishelf.com/wp-content/uploads/2020/01/Best-Biography-books-.png',
                              text: 'Biography',
                              onTap: () {
                                categoryController.cat.value = 'biography';
                                // Get.toNamed(Routes.OFFICE);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Cards(
                              image: 'https://m.media-amazon.com/images/I/91AiNeHUoNL._AC_UF1000,1000_QL80_.jpg',
                              text: 'Philosophy',
                              onTap: () {
                                categoryController.cat.value = 'philosophy';
                                // Get.toNamed(Routes.DINING);
                              },
                            ),
                            Cards(
                              image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsSNW0-ZK6pkRpggg6UrlD6W7c_PNPh3BzJw&s',
                              text: 'Romance',
                              onTap: () {
                                categoryController.cat.value = 'romance';
                                // Get.toNamed(Routes.OFFICE);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Cards(
                              image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlSUkBkaFznGY1nd6tJ9f2ZKiuOdKf9dnPwg&s',
                              text: 'Travel',
                              onTap: () {
                                categoryController.cat.value = 'travel';
                                // Get.toNamed(Routes.DINING);
                              },
                            ),
                            Cards(
                              image: 'https://m.media-amazon.com/images/I/61UlsdlWCPL._AC_UF1000,1000_QL80_.jpg',
                              text: 'Drama',
                              onTap: () {
                                categoryController.cat.value = 'drama';
                                // Get.toNamed(Routes.OFFICE);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Cards(
                              image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWuKE7uhiJcWFxUINnEpbe-6GbogauhpTgPw&s',
                              text: 'Novel',
                              onTap: () {
                                categoryController.cat.value = 'novel';
                                // Get.toNamed(Routes.DINING);
                              },
                            ),
                            Cards(
                              image: 'https://m.media-amazon.com/images/I/91kKJPpNpaL._AC_UF1000,1000_QL80_.jpg',
                              text: 'Comic',
                              onTap: () {
                                categoryController.cat.value = 'comic';
                                // Get.toNamed(Routes.OFFICE);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Cards(
                              image: 'https://m.media-amazon.com/images/I/815yfXSZxHL._AC_UF1000,1000_QL80_.jpg',
                              text: 'Fairy Tale',
                              onTap: () {
                                categoryController.cat.value = 'fairytale';
                                // Get.toNamed(Routes.DINING);
                              },
                            ),
                            Cards(
                              image: 'https://heartspoken.com/wp-content/uploads/2014/11/Books-Spirit_54351916_600.jpg',
                              text: 'Spiritual',
                              onTap: () {
                                categoryController.cat.value = 'spiritual';
                                // Get.toNamed(Routes.OFFICE);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}