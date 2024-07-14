// ignore_for_file: unnecessary_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/general_controller.dart';
import '../utils/color.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  final VoidCallback onTap;
  final double? size;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.onTap,
    required this.size,
    required Color fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: generalConfigController.dheight * .07,
        width: double.infinity,
        decoration: BoxDecoration(
          color: appbar,
          borderRadius: BorderRadius.circular(12),
          // boxShadow: [
          //   BoxShadow(
          //     spreadRadius: 5,
          //     blurRadius: 10,
          //     color: Colors.grey.withOpacity(0.5),
          //   )
          // ]
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonText,
                style: GoogleFonts.aBeeZee(
                  color: black,
                  fontSize: size ?? 16,
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: 20,
                color: black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
