import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_bloc/home/Presenter/home_bloc.dart';
import 'package:medical_bloc/home/Presenter/home_status.dart';
import 'package:medical_bloc/main.dart';
import 'package:medical_bloc/utils/custom/custom_Button.dart';
import 'package:medical_bloc/utils/custom/textCustam.dart';
import 'package:medical_bloc/utils/custom/textFiled.dart';
import 'package:medical_bloc/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:typewritertext/typewritertext.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              7.h.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 40.w,
                    child: TypeWriter.text(
                      "Find your desire healt solution",
                      maintainSize: true,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      duration: Duration(milliseconds: 40),
                    ),
                  ),
                  SvgPicture.asset(Images.Notifications)
                ],
              ),
              5.h.height,
              FadeInDown(
                child: Textfiledcustam(
                    height: 0,
                    hinttext: 'Search doctor, drugs, articles...',
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
                    color: Color(0xffE8F3F1),
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
                              text: 'Early protection for your family health',
                              size: 18,
                              weight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 35.w,
                            height: 5.h,
                            child: RoundButton(
                              title: 'Learn more',
                              fun: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, right: 20),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              1.height,
                              Container(
                                height: 100,
                                width: 100,
                                decoration: const BoxDecoration(
                                    //      color: Colors.amber,
                                    image: DecorationImage(
                                        image:
                                            AssetImage('images/circular.png'))),
                              ),
                            ],
                          ),
                          FadeInLeft(child: Image.asset(Images.onboard1))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              4.h.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textcustam(
                    text: 'Top Doctor',
                    size: 18,
                    weight: FontWeight.w600,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/TopDoctors');
                    },
                    child: Textcustam(
                      text: 'See all',
                      size: 12,
                      col: appcolour,
                    ),
                  )
                ],
              ),
              10.height,
              FadeInRight(
                child: BlocBuilder<HomeBloc, HomeStatus>(
                  builder: (context, state) => SizedBox(
                    height: 175,
                    child: ListView.builder(
                      itemCount: state.TopDoctor.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 200,
                          width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffE8F3F1)),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                10.height,
                                Center(
                                    child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage(
                                      state.TopDoctor[index].doctorImage),
                                )),
                                10.height,
                                Textcustam(
                                  text: state.TopDoctor[index].doctorName,
                                  size: 12,
                                  weight: FontWeight.w600,
                                ),
                                Textcustam(
                                  text: state.TopDoctor[index].type,
                                  col: Colors.grey,
                                  size: 9,
                                ),
                                10.height,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Color.fromARGB(
                                              255, 217, 248, 245)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.star_outlined,
                                            size: 15,
                                            color: appcolour,
                                          ),
                                          Textcustam(
                                            text: state.TopDoctor[index].rating
                                                .toString(),
                                            size: 10,
                                            col: appcolour,
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          color: Colors.grey,
                                          size: 15,
                                        ),
                                        Textcustam(
                                          text: state.TopDoctor[index].loction,
                                          size: 9,
                                          col: Colors.grey,
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
