import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/button.dart';
import '../../controllers/createOrder_controller.dart';
import '../../controllers/singleton_controller.dart';
import '../../utils/color.dart';

class CreateOrderView extends StatefulWidget {
  const CreateOrderView({super.key});

  @override
  State<CreateOrderView> createState() => _CreateOrderViewState();
}

class _CreateOrderViewState extends State<CreateOrderView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  CreateorderController createorderController =
      getIt.get<CreateorderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Obx(() {
        if (createorderController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Provide Address',
                        style: GoogleFonts.aBeeZee(fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextFormField(
                            controller: createorderController.streetController,
                            decoration: InputDecoration(
                              // prefixIcon: const Icon(Icons.person),
                              labelText: 'Enter Street',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your street area';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          TextFormField(
                            controller: createorderController.cityController,
                            decoration: InputDecoration(
                              // prefixIcon: const Icon(Icons.email),
                              labelText: 'Enter city name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your city name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          TextFormField(
                            controller: createorderController.stateController,
                            decoration: InputDecoration(
                              labelText: 'Enter state',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your state';
                              }
                              return null;
                            },
                          ),
                          // const SizedBox(
                          //   height: 8,
                          // ),
                          const SizedBox(
                            height: 14,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: createorderController.pincodeController,
                            decoration: InputDecoration(
                              labelText: 'Enter pincode',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your pincode';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: createorderController.mobileController,
                            decoration: InputDecoration(
                              labelText: 'Enter Phone Number',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your phone';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            buttonText: 'Proceed TO checkout',
                            fontColor: black,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                if (createorderController.isLoading.value) {
                                  const CircularProgressIndicator();
                                } else {
                                  createorderController.createOrder();
                                }
                                createorderController.cityController.clear();
                                createorderController.stateController.clear();
                                createorderController.pincodeController.clear();
                                createorderController.streetController.clear();
                                createorderController.mobileController.clear();
                              }
                            },
                            size: 16,
                            buttonColor: containerColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
    ();
  }
}
