import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
                              image: 'assets/logo.png',
                              text: 'Crime',
                              onTap: () {
                                // Get.toNamed(Routes.LIVING);
                              },
                            ),
                            Cards(
                              image: 'assets/logo.png',
                              text: 'Mystrey',
                              onTap: () {
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
                              image: 'assets/logo.png',
                              text: 'Horror',
                              onTap: () {
                                // Get.toNamed(Routes.DINING);
                              },
                            ),
                            Cards(
                              image: 'assets/logo.png',
                              text: '',
                              onTap: () {
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
                              image: 'assets/logo.png',
                              text: 'Dining Room',
                              onTap: () {
                                // Get.toNamed(Routes.DINING);
                              },
                            ),
                            Cards(
                              image: 'assets/logo.png',
                              text: 'Home Office',
                              onTap: () {
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
                              image: 'assets/logo.png',
                              text: 'Dining Room',
                              onTap: () {
                                // Get.toNamed(Routes.DINING);
                              },
                            ),
                            Cards(
                              image: 'assets/logo.png',
                              text: 'Home Office',
                              onTap: () {
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