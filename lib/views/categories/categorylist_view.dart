import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odoohackathon1/utils/color.dart';

import '../../common/button.dart';
import '../../controllers/category_controller.dart';
import '../../controllers/singleton_controller.dart';

class CategorylistView extends StatefulWidget {
  const CategorylistView({super.key});

  @override
  State<CategorylistView> createState() => _CategorylistViewState();
}

class _CategorylistViewState extends State<CategorylistView> {

  CategoryController categoryController = getIt.get<CategoryController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
                    children: [
                      const SizedBox(height: 8),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: categoryController
                                  .categorySchemes!['product']?.length ??
                              0,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: .60,
                          ),
                          itemBuilder: (context, index) {
                            var scheme = categoryController
                                .categorySchemes!['product'][index];
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: containerColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          '${scheme['Image']['image1']}',
                                          height: 100,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      '${scheme['Name']}',
                                      style: GoogleFonts.aBeeZee(
                                        fontSize: 14,
                                        color: black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      'Price: ${scheme['price']}',
                                      style: GoogleFonts.aBeeZee(
                                        fontSize: 12,
                                        color: fontColor,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    CustomButton(
                                      buttonText: 'More Details',
                                      buttonColor: appbar,
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ProductScreen(
                                                    schemeDetails:
                                                        categoryController
                                                                .categorySchemes![
                                                            'product'][index])));
                                      },
                                      size: 14,
                                      fontColor: fontColor,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}