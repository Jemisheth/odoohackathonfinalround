import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odoohackathon1/controllers/createissue_controller.dart';

import '../../controllers/addcart_controller.dart';
import '../../controllers/general_controller.dart';
import '../../controllers/singleton_controller.dart';
import '../../utils/color.dart';

class BookView extends StatefulWidget {
  final Map<String, dynamic> bookDetails;

  const BookView({super.key, required this.bookDetails});

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  int currentIndex = 0;
  CartController cartController = getIt.get<CartController>();
  CreateissueController createissueController = getIt.get<CreateissueController>();


  @override
  Widget build(BuildContext context) {
    final images = [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          '${widget.bookDetails['Image']['image1']}',
          filterQuality: FilterQuality.high,
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          '${widget.bookDetails['Image']['image2']}',
          filterQuality: FilterQuality.high,
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: black,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            CupertinoIcons.left_chevron,
            size: 18,
          ),
        ),
        title: Text(
          'Book Details',
          style: GoogleFonts.aBeeZee(fontSize: 18),
        ),
        backgroundColor: whiteshade,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(color: blackshade),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 2.0, top: 8.0, bottom: 8.0),
                    child: CarouselSlider(
                      items: images,
                      options: CarouselOptions(
                        autoPlay: true,
                        height: 300,
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
                const Divider(),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Name: ${widget.bookDetails['Title']}',
                    style: GoogleFonts.aBeeZee(fontSize: 14),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'OverView: ${widget.bookDetails['description'].toString()}',
                            style: GoogleFonts.aBeeZee(fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Book Author: ${widget.bookDetails['Author'][0]['Name'].toString()}',
                            style: GoogleFonts.aBeeZee(fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'ISBN NO: ${widget.bookDetails['volumes'][0]['ISBN'].toString()}',
                            style: GoogleFonts.aBeeZee(fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Publication Year: ${widget.bookDetails['volumes'][0]['PublicationYear'].toString()}',
                            style: GoogleFonts.aBeeZee(fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Genre: ${widget.bookDetails['Category']['name'].toString()}',
                            style: GoogleFonts.aBeeZee(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'View Complete Collection:',
                                style: GoogleFonts.aBeeZee(fontSize: 16),
                              ),
                              Text(
                                'View All',
                                style: GoogleFonts.aBeeZee(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        // add listview here
                        const Divider(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: white.withOpacity(0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price: ${widget.bookDetails['volumes'][0]['price'].toString()}',
                    style: GoogleFonts.aBeeZee(fontSize: 20),
                  ),
                  Obx(() {
                    if (cartController.isLoading.value) {
                      return const CircularProgressIndicator();
                    } else {
                      return GestureDetector(
                        onTap: () {
                          _showIssueBookDialog(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          height: 50,
                          width: generalConfigController.dwidth * .4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: containerColor),
                          child: Center(
                              child: Text(
                            'Issue Book',
                            style: GoogleFonts.aBeeZee(fontSize: 14),
                          )),
                        ),
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showIssueBookDialog(BuildContext context) {
    TextEditingController reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Issue', style: GoogleFonts.aBeeZee()),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Do you want to issue this book?',
                  style: GoogleFonts.aBeeZee()),
              const SizedBox(height: 16),
              TextField(
                keyboardType: TextInputType.phone,
                controller: createissueController.durationController,
                decoration: const InputDecoration(
                  labelText: 'Enter Duration(In days)',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel', style: GoogleFonts.aBeeZee()),
            ),
            TextButton(
              onPressed: () {
                createissueController.createOrder();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Confirm', style: GoogleFonts.aBeeZee()),
            ),
          ],
        );
      },
    );
  }
}
