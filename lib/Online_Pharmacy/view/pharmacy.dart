import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_bloc/Online_Pharmacy/presenter/arcticles_block.dart';
import 'package:medical_bloc/Online_Pharmacy/presenter/arcticles_status.dart';
import 'package:medical_bloc/Online_Pharmacy/view/drugs_detail.dart';
import 'package:medical_bloc/main.dart';
import 'package:medical_bloc/utils/custom/custom_Button.dart';
import 'package:medical_bloc/utils/custom/textCustam.dart';
import 'package:medical_bloc/utils/custom/textFiled.dart';
import 'package:medical_bloc/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PharmacyScreen extends StatelessWidget {
  const PharmacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColour,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              7.h.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new)),
                  Textcustam(
                    text: 'Arcticles',
                    size: 18,
                    weight: FontWeight.w600,
                  ),
                  const Icon(
                    Icons.shopping_cart_checkout,
                    color: whiteColour,
                  )
                ],
              ),
              3.h.height,
              FadeInDown(
                child: Textfiledcustam(
                    hinttext: 'Search drugs, category...',
                    starticon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(Images.Search),
                    )),
              ),
              3.h.height,
              Container(
                height: 135,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xffE8F3F1),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 45.w,
                            child: Textcustam(
                              text: 'Order quickly with Prescription',
                              size: 18,
                              weight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 30.w,
                            height: 4.h,
                            child: RoundButton(
                              title: 'Upload ', //Upload Prescription
                              fun: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 10, right: 20),
                        child:
                            FadeInLeft(child: Image.asset(Images.contractrqe)))
                  ],
                ),
              ),
              3.h.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textcustam(
                    text: 'Popular Product',
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                  Textcustam(
                    text: 'See all',
                    col: appcolour,
                  )
                ],
              ),
              3.h.height,
              FadeInRight(
                child: SizedBox(
                    height: 200,
                    child: BlocBuilder<ArcticlesBlock, ArcticlesStatus>(
                      builder: (context, state) => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.PopularProduct.length,
                        itemBuilder: (context, index) {
                          //
                          //
                          //
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DrugsDetail(
                                        image:
                                            state.PopularProduct[index].images,
                                        name: state.PopularProduct[index].title,
                                        ml: state.PopularProduct[index].ml,
                                        price:
                                            state.PopularProduct[index].price),
                                  ));
                            },
                            child: Container(
                              height: 219,
                              width: 159,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xffE8F3F1),
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(state
                                                .PopularProduct[index].images),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: SvgPicture.asset(
                                            Images.Bookmark,
                                            height: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    7.height,
                                    SizedBox(
                                      width: 130,
                                      child: Textcustam(
                                        text: state.PopularProduct[index].title,
                                        size: 12,
                                        weight: FontWeight.w600,
                                      ),
                                    ),
                                    3.height,
                                    Textcustam(
                                      text: state.PopularProduct[index].ml,
                                      size: 12,
                                      weight: FontWeight.w500,
                                      col: Colors.grey,
                                    ),
                                    2.h.height,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Textcustam(
                                          text:
                                              '\$ ${state.PopularProduct[index].price}',
                                          size: 16,
                                          weight: FontWeight.w700,
                                        ),
                                        SvgPicture.asset('images/add.svg')
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )),
              )

              ///
              ///
              ///
              ///
              ,
              3.h.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textcustam(
                    text: 'Product on Sale',
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                  Textcustam(
                    text: 'See all',
                    col: appcolour,
                  )
                ],
              ),
              3.h.height,
              FadeInRight(
                child: SizedBox(
                    height: 200,
                    child: BlocBuilder<ArcticlesBlock, ArcticlesStatus>(
                      builder: (context, state) => ListView.builder(
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.PopularProduct.length,
                        itemBuilder: (context, index) {
                          //
                          //
                          //
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/DrugsDetail');
                            },
                            child: Container(
                              height: 219,
                              width: 159,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xffE8F3F1),
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(state
                                                .PopularProduct[index].images),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: SvgPicture.asset(
                                            Images.Bookmark,
                                            height: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    7.height,
                                    SizedBox(
                                      width: 130,
                                      child: Textcustam(
                                        text: state.PopularProduct[index].title,
                                        size: 12,
                                        weight: FontWeight.w600,
                                      ),
                                    ),
                                    3.height,
                                    Textcustam(
                                      text: state.PopularProduct[index].ml,
                                      size: 12,
                                      weight: FontWeight.w500,
                                      col: Colors.grey,
                                    ),
                                    2.h.height,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Textcustam(
                                          text:
                                              '\$ ${state.PopularProduct[index].price}',
                                          size: 16,
                                          weight: FontWeight.w700,
                                        ),
                                        const Text(
                                          '\$8.99',
                                          style: TextStyle(
                                            fontSize:
                                                9, // Adjust the size as needed
                                            // fontFeatures: [
                                            //   FontFeature.enable('sups')
                                            // ], // This enables the superscript style, if supported
                                            decoration: TextDecoration
                                                .lineThrough, // Adds the strikethrough line
                                            color: Colors
                                                .grey, // Adjust the color as needed
                                          ),
                                        ),
                                        SvgPicture.asset('images/add.svg')
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )),
              )

              // FadeInLeft(
              //   child: SizedBox(
              //     height: 200,
              //     child: ListView.builder(
              //       reverse: tru,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         return Container(
              //           height: 219,
              //           width: 159,
              //           margin: const EdgeInsets.only(right: 10),
              //           decoration: BoxDecoration(
              //               border: Border.all(
              //                 color: const Color(0xffE8F3F1),
              //               ),
              //               borderRadius: BorderRadius.circular(10)),
              //           child: Padding(
              //             padding: const EdgeInsets.all(5.0),
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Container(
              //                   height: 100,
              //                   width: double.infinity,
              //                   decoration: BoxDecoration(
              //                       image: DecorationImage(
              //                         image: AssetImage(Images.m2),
              //                       ),
              //                       borderRadius: BorderRadius.circular(10)),
              //                   child: Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Align(
              //                       alignment: Alignment.topRight,
              //                       child: SvgPicture.asset(
              //                         Images.Bookmark,
              //                         height: 20,
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //                 7.height,
              //                 SizedBox(
              //                   width: 130,
              //                   child: Textcustam(
              //                     text: 'Bodrex Herbal',
              //                     size: 12,
              //                     weight: FontWeight.w600,
              //                   ),
              //                 ),
              //                 3.height,
              //                 Textcustam(
              //                   text: '100ml',
              //                   size: 12,
              //                   weight: FontWeight.w500,
              //                   col: Colors.grey,
              //                 ),
              //                 2.h.height,
              //                 Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Textcustam(
              //                       text: '\$7.99',
              //                       size: 16,
              //                       weight: FontWeight.w700,
              //                     ),
              //                     const Text(
              //                       '\$8.99',
              //                       style: TextStyle(
              //                         fontSize: 9, // Adjust the size as needed
              //                         // fontFeatures: [
              //                         //   FontFeature.enable('sups')
              //                         // ], // This enables the superscript style, if supported
              //                         decoration: TextDecoration
              //                             .lineThrough, // Adds the strikethrough line
              //                         color: Colors
              //                             .grey, // Adjust the color as needed
              //                       ),
              //                     ),
              //                     SvgPicture.asset('images/add.svg')
              //                   ],
              //                 )
              //               ],
              //             ),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // ),

              ,
              20.height
            ],
          ),
        ),
      ),
    );
  }
}
