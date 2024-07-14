import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odoohackathon1/utils/color.dart';

import '../../common/button.dart';
import '../../controllers/category_controller.dart';
import '../../controllers/search_controller.dart';
import '../../controllers/singleton_controller.dart';
import '../book/book_view.dart';

class CategorylistView extends StatefulWidget {
  const CategorylistView({super.key});

  @override
  State<CategorylistView> createState() => _CategorylistViewState();
}

class _CategorylistViewState extends State<CategorylistView> {

  CategoryController categoryController = getIt.get<CategoryController>();
  SearchControllerList searchControllerList = getIt.get<SearchControllerList>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar,
      ),
      body: SingleChildScrollView(
        child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: categoryController
                                  .categoryBook!['books']['title']?.length ??
                              0,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: .50,
                          ),
                          itemBuilder: (context, index) {
                            var scheme = categoryController
                                .categoryBook!['books']['title'][index];
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
                                          width: 100,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      '${scheme['Title']}',
                                      style: GoogleFonts.aBeeZee(
                                        fontSize: 14,
                                        color: black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      'Price: ${scheme['volumes'][0]['price']}',
                                      style: GoogleFonts.aBeeZee(
                                        fontSize: 12,
                                        color: black,
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
                                                  builder: (context) => BookView(
                                                      bookDetails:
                                                          searchControllerList
                                                                  .searchBook![
                                                              'books']['title'][0])));
                                      },
                                      size: 14,
                                      fontColor: black,
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