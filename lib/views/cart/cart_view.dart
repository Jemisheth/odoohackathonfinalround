// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../common/button.dart';
import '../../../controllers/general_controller.dart';
import '../../../controllers/singleton_controller.dart';
import '../../../utils/color.dart';
import '../../common/footer.dart';
import '../../controllers/addcart_controller.dart';
import '../../controllers/createpayment_controller.dart';
import '../../controllers/getusercart_controller.dart';
import '../../routes/app_routes.dart';

class CartViewScreen extends StatefulWidget {
  const CartViewScreen({super.key});

  @override
  State<CartViewScreen> createState() => _CartViewScreenState();
}

class _CartViewScreenState extends State<CartViewScreen> {
  CartController cartController = getIt.get<CartController>();
  GetUserCart getUserCart = getIt.get<GetUserCart>();
  CreatepaymentController createpaymentController =
      getIt.get<CreatepaymentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'CART PAGE',
          style: GoogleFonts.aBeeZee(fontSize: 16),
        ),
        backgroundColor: appbar,
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
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    if (getUserCart.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Cart Details',
                                  style: GoogleFonts.aBeeZee(fontSize: 16),
                                ),
                                Text(
                                  'Total Products(${getUserCart.userCart!['cart']['totalItem'].toString()})',
                                  style: GoogleFonts.aBeeZee(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
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
                                      "Products in cart:",
                                      style: GoogleFonts.aBeeZee(fontSize: 18),
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: getUserCart
                                            .userCart!['cart']['cartItems']
                                            ?.length ??
                                        0,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                leading: Image.network(
                                                    '${getUserCart.userCart!['cart']['cartItems'][index]['product']['Image']['image1']}'),
                                                title: Text(
                                                    '${getUserCart.userCart!['cart']['cartItems'][index]['product']['Name']}'),
                                                subtitle: Text(
                                                    'Price: ${getUserCart.userCart!['cart']['cartItems'][index]['product']['price']}'),
                                                trailing: Text(
                                                    'Quantity: ${getUserCart.userCart!['cart']['cartItems'][index]['quantity']}'),
                                              ),
                                              Divider(color: black),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: CustomButton(
                                                  buttonText: 'Remove Item',
                                                  buttonColor: containerColor,
                                                  onTap: () {
                                                    setState(() {
                                                      getUserCart.deleteCartItem(
                                                          getUserCart.userCart![
                                                                      'cart']
                                                                  ['cartItems']
                                                              [index]['_id']);
                                                    });
                                                  },
                                                  size: 14,
                                                  fontColor: black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Footer(),
                        ],
                      );
                    }
                  }),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total',
                          style: GoogleFonts.aBeeZee(fontSize: 14),
                        ),
                        Text(
                          'Price: ${getUserCart.userCart!['cart']['totalPrice'].toString()}',
                          style: GoogleFonts.aBeeZee(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Inclusive of all tax',
                          style: GoogleFonts.aBeeZee(fontSize: 12),
                        ),
                      ],
                    ),
                    generalConfigController.box.hasData('userID')
                        ? Obx(() {
                            if (createpaymentController.isLoading.value) {
                              return const CircularProgressIndicator();
                            } else {
                              return GestureDetector(
                                onTap: () {
                                  createpaymentController.createPayment();
                                  // createpaymentController.launchUrl1(
                                  //     Uri.parse(
                                  //         '${generalConfigController.box.read('link')}'),
                                  //     true);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  height: 50,
                                  width: generalConfigController.dwidth * .45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: containerColor),
                                  child: Center(
                                      child: Text(
                                    'Pay Now',
                                    style: GoogleFonts.aBeeZee(fontSize: 14),
                                  )),
                                ),
                              );
                            }
                          })
                        : Obx(() {
                            if (cartController.isLoading.value) {
                              return const CircularProgressIndicator();
                            } else {
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.CREATEORDERVIEW);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  height: 50,
                                  width: generalConfigController.dwidth * .45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: containerColor),
                                  child: Center(
                                      child: Text(
                                    'Place Order',
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
      ),
    );
  }
}
