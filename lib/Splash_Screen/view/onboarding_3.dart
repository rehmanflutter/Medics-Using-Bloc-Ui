import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_bloc/main.dart';
import 'package:medical_bloc/utils/custom/custom_Button.dart';
import 'package:medical_bloc/utils/custom/textCustam.dart';
import 'package:medical_bloc/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:typewritertext/typewritertext.dart';

class OnboardingEnterPoint extends StatelessWidget {
  const OnboardingEnterPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: FadeInDown(
              child: SvgPicture.asset(
                Images.logo,
                color: appcolour,
                height: 90,
                width: 90,
              ),
            )),
            4.height,
            Textcustam(
              text: 'Medics',
              size: 20,
              col: appcolour,
              weight: FontWeight.w700,
            ),
            3.h.height,
            Textcustam(
              text: 'Let’s get started!',
              size: 20,
              //   col: whiteColour,
              weight: FontWeight.w700,
            ),
            3.height,
            TypeWriter.text(
              "Login to enjoy the features we’ve provided, and stay healthy!",
              maintainSize: true,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
              ),
              duration: Duration(milliseconds: 30),
            ),
            // Textcustam(
            //   align: TextAlign.center,
            //   text:
            //       'Login to enjoy the features we’ve provided, and stay healthy!',
            //   col: Colors.grey,
            // ),
            7.h.height,
            FadeInLeft(
              child: RoundButton(
                title: 'Login',
                fun: () {
                  Navigator.pushNamed(context, '/LoginScreen');
                },
              ),
            ),
            2.h.height,
            FadeInRight(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/SigupScreen');
                },
                child: Container(
                  height: 7.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: appcolour)),
                  child: Center(
                    child: Textcustam(
                      text: 'Sign Up',
                      size: 16,
                      weight: FontWeight.w500,
                      col: appcolour,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
