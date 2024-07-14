import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import '../controllers/general_controller.dart';
import '../utils/color.dart';

class Cards extends StatelessWidget {
  final String text;
  final String image;
  final VoidCallback? onTap;

  const Cards({
    super.key,
    required this.text,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * .20,
        width: size.width * .43,
        decoration: BoxDecoration(
            color: appbar, borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fitHeight,
                  height: 100,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.aBeeZee(fontSize: 14, color: white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
