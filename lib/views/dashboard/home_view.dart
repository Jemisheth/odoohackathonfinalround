// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odoohackathon1/common/drawer.dart';
import 'package:odoohackathon1/common/footer.dart';
import 'package:odoohackathon1/controllers/singleton_controller.dart';

// import '../../common/categories.dart';
import '../../controllers/general_controller.dart';
import '../../controllers/search_controller.dart';
import '../../utils/color.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  SearchControllerList searchControllerList = getIt.get<SearchControllerList>();
  @override
  Widget build(BuildContext context) {
    final images = [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assets/logo.png',
          fit: BoxFit.fill,
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assets/logo.png',
          fit: BoxFit.fill,
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assets/logo.png',
          fit: BoxFit.fill,
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: background,
      drawer: drawer(),
      appBar: AppBar(
        backgroundColor: containerColor,
        title: Text(
          'The Book Hub',
          style: GoogleFonts.aBeeZee(
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
            ),
          ),
          IconButton(
            onPressed: () {
              //  getUserCart.fetchUserCart();
            },
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: generalConfigController.dheight * .28,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: CarouselSlider(
                  items: images,
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 250,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    enlargeCenterPage: true,
                    aspectRatio: 1.0,
                    autoPlayCurve: Curves.fastOutSlowIn,
                  ),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchControllerList.searchTextController,
                decoration: const InputDecoration(
                  labelText: 'Search Books here',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  searchControllerList.fetchsearchBook();
                },
                child: Container(
                  height: 50,
                  width: generalConfigController.dwidth * .5,
                  decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    'Search',
                    style: GoogleFonts.aBeeZee(fontSize: 16),
                  )),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: generalConfigController.dheight * .51,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'New Arrival Books:',
                              style: GoogleFonts.aBeeZee(
                                fontSize: 20,
                                // color: fontColor,
                              ),
                            ),
                          ),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height:
                                        generalConfigController.dheight * .1,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: btncolor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Image.network(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTrO5dL3mThe9MCr5sRw7LraJ-hdRmA3jZFg&s',
                                                fit: BoxFit.fill,
                                                height: 85,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Name: Ikigai',
                                                    style: GoogleFonts.aBeeZee(
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                    'Author: Hector Garcia',
                                                    style: GoogleFonts.aBeeZee(
                                                        fontSize: 16),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          Icon(Icons.chevron_right)
                                        ],
                                      ),
                                    ),
                                  ));
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: generalConfigController.dheight * .51,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Trending Books:',
                              style: GoogleFonts.aBeeZee(
                                fontSize: 20,
                                // color: fontColor,
                              ),
                            ),
                          ),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height:
                                        generalConfigController.dheight * .1,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: btncolor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Image.network(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTrO5dL3mThe9MCr5sRw7LraJ-hdRmA3jZFg&s',
                                                fit: BoxFit.fill,
                                                height: 85,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Name: Ikigai',
                                                    style: GoogleFonts.aBeeZee(
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                    'Author: Hector Garcia',
                                                    style: GoogleFonts.aBeeZee(
                                                        fontSize: 16),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          const Icon(Icons.chevron_right)
                                        ],
                                      ),
                                    ),
                                  ));
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Footer(),
            )
          ],
        ),
      ),
    );
  }
}
