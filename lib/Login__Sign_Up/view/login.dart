import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_bloc/Login__Sign_Up/Presenter/login_Bloc.dart';
import 'package:medical_bloc/Login__Sign_Up/Presenter/login_event.dart';
import 'package:medical_bloc/Login__Sign_Up/Presenter/login_status.dart';
import 'package:medical_bloc/main.dart';
import 'package:medical_bloc/utils/custom/custom_Button.dart';
import 'package:medical_bloc/utils/custom/textCustam.dart';
import 'package:medical_bloc/utils/custom/textFiled.dart';
import 'package:medical_bloc/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    text: 'Login',
                    size: 17,
                    weight: FontWeight.w700,
                  ),
                  SizedBox()
                ],
              ),
              9.h.height,
              FadeInLeft(
                child: Textfiledcustam(
                  starticon: const Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  hinttext: 'Enter your email',
                ),
              ),
              3.h.height,
              FadeInRight(
                  child: BlocBuilder<LoginBloc, LoginStatus>(
                builder: (context, state) => Textfiledcustam(
                  obscur: state.loginpassword,
                  starticon: const Icon(
                    Icons.lock_open_rounded,
                    color: Colors.grey,
                  ),
                  lasticon: GestureDetector(
                    onTap: () {
                      context.read<LoginBloc>().add(loginPassword());
                    },
                    child: Icon(state.loginpassword
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye_outlined),
                  ),
                  hinttext: 'Enter your password',
                ),
              )),
              6.h.height,
              FadeInUp(
                child: RoundButton(
                  title: 'Login',
                  fun: () {
                    Navigator.pushNamed(context, '/BottomAppBarCus');
                  },
                ),
              ),

              20.height,
              FadeInRight(
                duration: const Duration(milliseconds: 2000),
                child: Row(
                  children: [
                    const Expanded(
                        child: Divider(
                      color: Color(0xffEEEEEE),
                    )),
                    Textcustam(
                      text: '  or continue with  ',
                      col: Color(0xff616161),
                    ),
                    const Expanded(
                        child: Divider(
                      color: Color(0xffEEEEEE),
                    ))
                  ],
                ),
              ),
              5.h.height,

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SvgPicture.asset('images/google.svg'),
                    FadeInLeft(child: SvgPicture.asset('images/facbook.svg')),
                    FadeInUp(child: SvgPicture.asset('images/googles.svg')),
                    FadeInRight(child: SvgPicture.asset('images/apple.svg')),
                  ],
                ),
              )
              //   Image.asset('images/LoginOptions.png')
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Textcustam(
              text: 'Don’t have an account? ',
              col: Colors.grey,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/SigupScreen');
              },
              child: Textcustam(
                text: ' Sign Up',
                col: appcolour,
              ),
            )
          ],
        ),
      ),
    );
  }
}
