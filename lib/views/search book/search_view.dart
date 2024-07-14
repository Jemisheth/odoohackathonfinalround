import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odoohackathon1/common/button.dart';
import 'package:odoohackathon1/controllers/search_controller.dart';
import 'package:odoohackathon1/controllers/singleton_controller.dart';
import 'package:odoohackathon1/views/book/book_view.dart';

import '../../controllers/general_controller.dart';
import '../../utils/color.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  SearchControllerList searchControllerList = getIt.get<SearchControllerList>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: appbar,
        title: Text(
          'Searched Book',
          style: GoogleFonts.aBeeZee(fontSize: 16),
        ),
      ),
      body: Obx(() {
        if (searchControllerList.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (searchControllerList.searchBook == null ||
            searchControllerList.searchBook!['books'] == null ||
            searchControllerList.searchBook!['books'].isEmpty) {
          return Center(
            child: Text(
              'NO DATA FOUND',
              style: GoogleFonts.aBeeZee(fontSize: 20),
            ),
          );
        } else {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                    child: Text(
                      'books Available: ',
                      style: GoogleFonts.aBeeZee(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          searchControllerList.searchBook!['books'].length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            // height: generalConfigController.dheight * .3,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: containerColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.network(
                                            '${searchControllerList.searchBook!['books']['title'][index]['Image']['image1']}',
                                            height: 100,
                                            width: 100,
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 220,
                                                child: Text(
                                                  'Name: ${searchControllerList.searchBook!['books']['title'][index]['Title']}',
                                                  style: GoogleFonts.aBeeZee(
                                                      fontSize: 16),
                                                ),
                                              ),
                                              Text(
                                                'Author: Hector Garcia',
                                                style: GoogleFonts.aBeeZee(
                                                    fontSize: 14),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomButton(
                                    buttonText: 'More Details',
                                    buttonColor: containerColor,
                                    onTap: () {
                                      Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => BookView(
                                                      bookDetails:
                                                          searchControllerList
                                                                  .searchBook![
                                                              'books']['title'][index])));
                                    },
                                    size: 16,
                                    fontColor: black,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
