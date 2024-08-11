import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_bloc/Login__Sign_Up/Presenter/login_Bloc.dart';
import 'package:medical_bloc/Login__Sign_Up/Presenter/login_event.dart';
import 'package:medical_bloc/Login__Sign_Up/Presenter/login_status.dart';
import 'package:medical_bloc/main.dart';
import 'package:medical_bloc/utils/custom/custom_Button.dart';
import 'package:medical_bloc/utils/custom/textCustam.dart';
import 'package:medical_bloc/utils/custom/textFiled.dart';
import 'package:medical_bloc/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:typewritertext/typewritertext.dart';

class SigupScreen extends StatelessWidget {
  const SigupScreen({super.key});

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
                    text: 'Sign Up',
                    size: 17,
                    weight: FontWeight.w700,
                  ),
                  SizedBox()
                ],
              ),
              9.h.height,
              FadeInDown(
                child: Textfiledcustam(
                  starticon: const Icon(
                    Icons.person_outline_outlined,
                    color: Colors.grey,
                  ),
                  hinttext: 'Enter your name',
                ),
              ),
              3.h.height,
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
                buildWhen: (previous, current) =>
                    previous.siguppassword != current.siguppassword,
                builder: (context, state) => Textfiledcustam(
                  obscur: state.siguppassword,
                  starticon: const Icon(
                    Icons.lock_open_rounded,
                    color: Colors.grey,
                  ),
                  lasticon: GestureDetector(
                    onTap: () {
                      context.read<LoginBloc>().add(SigupPassword());
                    },
                    child: Icon(state.siguppassword
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye_outlined),
                  ),
                  hinttext: 'Enter your password',
                ),
              )),
              6.h.height,
              Row(
                children: [
                  BlocBuilder<LoginBloc, LoginStatus>(
                    buildWhen: (previous, current) {
                      return previous.Privacypolicy != current.Privacypolicy;
                    },
                    builder: (context, state) => Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      activeColor: appcolour,
                      value: state.Privacypolicy,
                      onChanged: (value) {
                        context.read<LoginBloc>().add(PrivacyPolicy());
                      },
                    ),
                  ),
                  6.width,
                  SizedBox(
                    width: 70.w,
                    child: TypeWriter.text(
                      "I agree to the medidoc Terms of Service and Privacy Policy",
                      maintainSize: true,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                      duration: Duration(milliseconds: 40),
                    ),
                  )
                ],
              ),
              5.h.height,
              FadeInUp(
                child: RoundButton(
                  title: 'Sign Up',
                  fun: () {
                    Navigator.pushNamed(context, '/BottomAppBarCus');
                  },
                ),
              ),
              15.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Textcustam(
                    text: 'Alread have an account? ',
                    col: Colors.grey,
                  ),
                  Textcustam(
                    text: '  Login',
                    col: appcolour,
                  )
                ],
              ),
              15.height,
            ],
          ),
        ),
      ),
    );
  }
}
