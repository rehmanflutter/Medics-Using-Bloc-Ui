import 'package:flutter/material.dart';
import 'package:medical_bloc/utils/custom/textCustam.dart';
import 'package:medical_bloc/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback fun;
  final Color? col;
  final Color? textcolor;
  final Color? backcol;
  final bool? loading;
  RoundButton({
    required this.title,
    required this.fun,
    this.col,
    this.textcolor = Colors.white,
    this.loading = false,
    this.backcol = const Color(0xff9B8579),
  });
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Container(
      height: 8.h, //media.height * 0.07,
      width: media.width,
      child: ElevatedButton(
        onPressed: fun,
        child: Center(
          child: loading == true
              ? CircularProgressIndicator(
                  backgroundColor: Colors.transparent,
                  color: Colors.white,
                )
              : Textcustam(
                  text: title,
                  col: textcolor,
                  size: 16,
                  weight: FontWeight.w500,
                ),
        ),
        style: ElevatedButton.styleFrom(
            // elevation: 5,
            // shadowColor: Colors.blue.shade300,
            backgroundColor: appcolour,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
