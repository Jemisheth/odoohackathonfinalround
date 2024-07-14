import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odoohackathon1/controllers/search_controller.dart';
import 'package:odoohackathon1/controllers/singleton_controller.dart';

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
    return  Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: appbar,
        title: Text('Searched Book', style: GoogleFonts.aBeeZee(fontSize: 16),),
      ),
      body: Obx(() {
        if (searchControllerList.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (searchControllerList.searchBook == null ||
            searchControllerList.searchBook!['product'] == null ||
            searchControllerList.searchBook!['product'].isEmpty) {
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
                      'Product Available: ',
                      style: GoogleFonts.aBeeZee(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: searchControllerList
                          .searchBook!['product'].length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: generalConfigController.dheight * .3,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: containerColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    '${searchControllerList.searchBook!['product'][index]['Image']['image1']}',
                                    height: 100,
                                  ),
                                  Text(
                                    'Price: ${searchControllerList.searchBook!['product'][index]['price'].toString()}',
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: 18,
                                      color: black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => ProductScreen(
                                      //             schemeDetails:
                                      //                 searchControllerList
                                      //                         .searchBook![
                                      //                     'product'][index])));
                                    },
                                    child: Container(
                                      height:
                                          generalConfigController.dheight * .06,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: appbar,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'More details',
                                              style: GoogleFonts.aBeeZee(
                                                fontSize: 16,
                                                color: white,
                                              ),
                                            ),
                                            Icon(
                                              Icons.chevron_right,
                                              size: 20,
                                              color: white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
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