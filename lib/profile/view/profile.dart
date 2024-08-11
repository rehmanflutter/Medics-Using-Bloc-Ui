import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_bloc/main.dart';
import 'package:medical_bloc/profile/view/preswnter/profile_bloc.dart';
import 'package:medical_bloc/profile/view/preswnter/profile_event.dart';
import 'package:medical_bloc/profile/view/preswnter/profile_status.dart';
import 'package:medical_bloc/utils/custom/textCustam.dart';
import 'package:medical_bloc/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff30ADA2),
                  Color.fromARGB(255, 93, 240, 228),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                10.h.height,
                Stack(
                  children: [
                    BlocBuilder<ProfileBloc, ProfileStatus>(
                        builder: (context, state) => // state.file == null?
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: state.file == null
                                          ? AssetImage(Images.doctor2)
                                          : FileImage(File(state.file!.path)),
                                      fit: BoxFit.cover)),
                            )
                        //: Image.file(File(state.file!.path)),
                        ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: FadeInDown(
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .read<ProfileBloc>()
                                  .add(GalleryImagePicker());
                            },
                            child: SvgPicture.asset(
                              'images/camara.svg',
                              height: 30,
                            ),
                          ),
                        ))
                  ],
                ),
                2.h.height,
                Textcustam(
                  text: 'Amelia Renata',
                  size: 18,
                  weight: FontWeight.w600,
                  col: whiteColour,
                ),
                3.h.height,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FadeInLeft(
                        child: _customwidget(
                            'images/Heartbeat.svg', 'Heart rate', '215bpm'),
                      ),
                      const SizedBox(
                          height: 60,
                          width: 6,
                          child: VerticalDivider(
                            color: Colors.white,
                          )),
                      _customwidget('images/Fire.svg', 'Calories', '756cal'),
                      const SizedBox(
                          height: 60,
                          width: 6,
                          child: VerticalDivider(
                            color: Colors.white,
                          )),
                      FadeInRight(
                          child: _customwidget(
                              'images/Barbell.svg', 'Weight', '103lbs')),
                    ],
                  ),
                ),
                4.h.height,
                Expanded(
                  child: BlocBuilder<ProfileBloc, ProfileStatus>(
                    builder: (context, state) => FadeInUp(
                        child: Container(
                      decoration: const BoxDecoration(
                          color: whiteColour,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: ListView.builder(
                        itemCount: state.feachers.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: SvgPicture.asset(
                                    state.feachers[index].image),
                                title: Textcustam(
                                  text: state.feachers[index].text,
                                  size: 16,
                                  weight: FontWeight.w600,
                                  col: index == 3 ? Colors.red : Colors.black,
                                ),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: Color(0xff555555),
                                ),
                              ),
                              index == 3
                                  ? SizedBox()
                                  : const Divider(
                                      color: Color(0xffE8F3F1),
                                    )
                            ],
                          );
                        },
                      ),
                    )),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 0,
            child: Image.asset(
              Images.lins,
              //color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _customwidget(String image, String text, String text2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(image),
        Textcustam(
          text: text,
          size: 11,
          col: Color(0xffC1F3EF),
        ),
        Textcustam(
          text: text2,
          size: 16,
          weight: FontWeight.w600,
          col: whiteColour,
        )
      ],
    );
  }
}
