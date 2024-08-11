import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_bloc/Online_Pharmacy/presenter/arcticles_block.dart';
import 'package:medical_bloc/Online_Pharmacy/presenter/arcticles_event.dart';
import 'package:medical_bloc/Online_Pharmacy/presenter/arcticles_status.dart';
import 'package:medical_bloc/main.dart';
import 'package:medical_bloc/utils/custom/custom_Button.dart';
import 'package:medical_bloc/utils/custom/textCustam.dart';
import 'package:medical_bloc/utils/images.dart';
import 'package:readmore/readmore.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_paypal/flutter_paypal.dart';

class DrugsDetail extends StatelessWidget {
  String image;
  String name;
  String ml;
  double price;
  DrugsDetail(
      {required this.image,
      required this.name,
      required this.ml,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColour,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    )
                  ],
                ),
                3.h.height,
                Center(child: FadeInUp(child: Image.asset(image))),
                4.h.height,
                FadeInDown(
                  child: Textcustam(
                    text: name,
                    size: 20,
                    weight: FontWeight.w600,
                  ),
                ),
                2.h.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FadeInRight(
                      child: Textcustam(
                        text: ml,
                        col: Colors.grey,
                      ),
                    ),
                    FadeInLeft(child: SvgPicture.asset(Images.Heart)),
                  ],
                ),
                2.h.height,
                FadeInRight(
                  child: RatingStars(
                    onValueChanged: (value) {},
                    axis: Axis.horizontal,
                    starCount: 5,
                    starSize: 10,
                    starSpacing: 2,

                    maxValueVisibility: false,
                    valueLabelVisibility: false,
                    animationDuration: Duration(milliseconds: 1000),
                    valueLabelPadding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                    valueLabelMargin: const EdgeInsets.only(right: 8),
                    starOffColor: appcolour, // const Color(0xffe7e8ea),
                    starColor: Colors.yellow,
                    angle: 12,
                  ),
                ),
                3.h.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<ArcticlesBlock, ArcticlesStatus>(
                        builder: (context, state) => Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context
                                        .read<ArcticlesBlock>()
                                        .add(AddItem(No: state.NoCount - 1));
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: Color(0xffADADAD),
                                  ),
                                ),
                                5.w.width,
                                Textcustam(
                                  text: state.NoCount.toString(),
                                  size: 24,
                                  weight: FontWeight.w600,
                                ),
                                5.w.width,
                                GestureDetector(
                                    onTap: () {
                                      context
                                          .read<ArcticlesBlock>()
                                          .add(AddItem(No: state.NoCount + 1));
                                    },
                                    child: SvgPicture.asset('images/add.svg'))
                              ],
                            )),
                    FadeInLeft(
                      child: Textcustam(
                        text: '\$ ${price}',
                        size: 20,
                        weight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                3.h.height,
                Textcustam(
                  text: 'Description',
                  size: 20,
                  weight: FontWeight.w600,
                ),
                1.h.height,
                FadeInUp(
                  child: const ReadMoreText(
                    'OBH COMBI  is a cough medicine containing, Paracetamol, Ephedrine HCl, and Chlorphenamine maleate which is used to relieve coughs accompanied by flu symptoms such as fever, headache, and sneezing... ',
                    trimMode: TrimMode.Line,
                    trimLines: 3,
                    colorClickableText: appcolour,
                    trimCollapsedText: ' Read more',
                    trimExpandedText: 'Read less',
                    moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: appcolour),
                  ),
                ),
                // Textcustam(
                //   text:
                //       'OBH COMBI  is a cough medicine containing, Paracetamol, Ephedrine HCl, and Chlorphenamine maleate which is used to relieve coughs accompanied by flu symptoms such as fever, headache, and sneezing... Read more',
                //   col: const Color(0xffADADAD),
                // )
              ],
            )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: FadeInUp(
          child: RoundButton(
            title: 'Buy Now',
            fun: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => UsePaypal(
                    sandboxMode: true,
                    clientId:
                        "AW1TdvpSGbIM5iP4HJNI5TyTmwpY9Gv9dYw8_8yW5lYIbCqf326vrkrp0ce9TAqjEGMHiV3OqJM_aRT0",
                    secretKey:
                        "EHHtTDjnmTZATYBPiGzZC_AZUfMpMAzj2VZUeqlFUrRJA_C0pQNCxDccB5qoRQSEdcOnnKQhycuOWdP9",
                    returnURL: "https://samplesite.com/return",
                    cancelURL: "https://samplesite.com/cancel",
                    transactions: const [
                      {
                        "amount": {
                          "total": '10.12',
                          "currency": "USD",
                          "details": {
                            "subtotal": '10.12',
                            "shipping": '0',
                            "shipping_discount": 0
                          }
                        },
                        "description": "The payment transaction description.",
                        // "payment_options": {
                        //   "allowed_payment_method":
                        //       "INSTANT_FUNDING_SOURCE"
                        // },
                        "item_list": {
                          "items": [
                            {
                              "name": "A demo product",
                              "quantity": 1,
                              "price": '10.12',
                              "currency": "USD"
                            }
                          ],

                          // shipping address is not required though
                          "shipping_address": {
                            "recipient_name": "Jane Foster",
                            "line1": "Travis County",
                            "line2": "",
                            "city": "Austin",
                            "country_code": "US",
                            "postal_code": "73301",
                            "phone": "+00000000",
                            "state": "Texas"
                          },
                        }
                      }
                    ],
                    note: "Contact us for any questions on your order.",
                    onSuccess: (Map params) async {
                      print("onSuccess: $params");
                    },
                    onError: (error) {
                      print("onError: $error");
                    },
                    onCancel: (params) {
                      print('cancelled: $params');
                    }),
              ));
            },
          ),
        ),
      ),
    );
  }
}
