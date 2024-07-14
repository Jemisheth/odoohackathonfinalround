import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/button.dart';
import '../controllers/general_controller.dart';
import '../utils/color.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar,
        foregroundColor: blackshade,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.chevron_left,
              size: 25,
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Contact Us',
                  style: GoogleFonts.aBeeZee(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: generalConfigController.dheight * .74,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 26.0),
                    child: Column(
                      children: [
                        TextField(
                          // controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        TextField(
                          // controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        TextField(
                          // controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Subject',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        TextField(
                          // controller: emailController,
                          maxLines: 4,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            labelText: 'Message',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomButton(
                          buttonText: 'Send Message',
                          buttonColor: containerColor,
                          onTap: () {},
                          size: 16,
                          fontColor: black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
