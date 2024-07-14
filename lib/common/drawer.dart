import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/general_controller.dart';
import '../routes/app_routes.dart';
import '../utils/color.dart';

Drawer drawer() {
    return Drawer(
      backgroundColor: drawerColor,
      child: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  // Get.toNamed(Routes.PROFILE);
                },
                child: Center(
                  child: ClipOval(
                    child: Image.asset(
                      'assets/logo.png',
                      // filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      height: 100,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              generalConfigController.box.hasData('username')
                  ? Center(
                      child: Text(
                        generalConfigController.box.read('username'),
                        style: GoogleFonts.aBeeZee(fontSize: 16, color: black),
                      ),
                    )
                  : Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.offAllNamed(Routes.LOGIN);
                        },
                        child: Text(
                          'please login',
                          style: GoogleFonts.aBeeZee(fontSize: 16),
                        ),
                      ),
                    ),
              Divider(
                thickness: 4,
                color: blackshade,
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      Icons.category,
                      color: black,
                      size: Get.width * .05,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Genres',
                      style: GoogleFonts.aBeeZee(fontSize: 16),
                    ),
                  ],
                ),
                onTap: () {
                  Get.toNamed(Routes.CATEGORIES);
                },
              ),
              Divider(
                thickness: 4,
                color: blackshade,
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      Icons.history,
                      color: black,
                      size: Get.width * .05,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Book History',
                      style: GoogleFonts.aBeeZee(fontSize: 16),
                    ),
                  ],
                ),
                onTap: () {
                  // Get.toNamed(Routes.ORDERVIEW);
                },
              ),
              Divider(
                thickness: 4,
                color: blackshade,
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: black,
                      size: Get.width * .05,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'About Us',
                      style: GoogleFonts.aBeeZee(fontSize: 16),
                    ),
                  ],
                ),
                onTap: () {
                  // Get.toNamed(Routes.ABOUT);
                },
              ),
              Divider(
                thickness: 4,
                color: blackshade,
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      Icons.contact_phone_rounded,
                      color: black,
                      size: Get.width * .05,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Contact Us',
                      style: GoogleFonts.aBeeZee(fontSize: 16),
                    ),
                  ],
                ),
                onTap: () {
                  // Get.toNamed(Routes.CONTACTPAGE);
                },
              ),
              Visibility(
                visible: generalConfigController.box.hasData('username'),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        thickness: 4,
                        color: blackshade,
                      ),
                      ListTile(
                        onTap: () {
                          // todo logout dialog box
                          // loginController.usernameController.clear();
                          generalConfigController.box.erase();
                          Get.offAllNamed(Routes.LOGIN);
                        },
                        title: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: black,
                              size: Get.width * .05,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Logout',
                              style: GoogleFonts.aBeeZee(fontSize: 16),
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            ]),
      ),
    );
  }