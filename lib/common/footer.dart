import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/color.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        height: size.height * .3,
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(10)),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/logo.png',
                height: 85,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            'Name here',
            style: GoogleFonts.aBeeZee(),
          )),
          const SizedBox(
            height: 18,
          ),
          Text(
            'Follow Us On',
            style: GoogleFonts.aBeeZee(),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                width: 40,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(200),
                  ),
                ),
                child: Image.asset('assets/socials/ig.jpg'),
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                width: 40,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(200),
                  ),
                ),
                child: Image.asset('assets/socials/fb.png'),
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                width: 40,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(200),
                  ),
                ),
                child: Image.asset('assets/socials/linkedin.png'),
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                width: 40,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(200),
                  ),
                ),
                child: Image.asset('assets/socials/pinterest.png'),
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                width: 40,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(200),
                  ),
                ),
                child: Image.asset('assets/socials/yt.png'),
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                width: 40,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(200),
                  ),
                ),
                child: Image.asset('assets/socials/x.png'),
              ),
            ]),
          ),
        ]));
  }
}
