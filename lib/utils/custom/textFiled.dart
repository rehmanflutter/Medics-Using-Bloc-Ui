import 'package:flutter/material.dart';

class Textfiledcustam extends StatelessWidget {
  // final formKey = GlobalKey<FormState>();

  final String hinttext;
  final String? labeltext;
  final Widget? starticon;
  final Widget? lasticon;
  final bool? obscur;
  final VoidCallback? fun;
  final bool? focus;
  final double? height;

  final TextInputType? keyboardType;
  final TextEditingController? controller;

  Textfiledcustam({
    required this.hinttext,
    this.controller,
    this.labeltext,
    this.lasticon,
    this.obscur = false,
    this.starticon,
    this.keyboardType,
    this.fun,
    this.focus = false,
    this.height = 20,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: focus!,
      // key: formKey,
      obscureText: obscur!,
      keyboardType: keyboardType,
      style: const TextStyle(
        fontSize: 14,
      ),
      controller: controller,

      cursorColor: Colors.blue,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffF9FAFB), //   your fillColor
        contentPadding: EdgeInsets.all(height!),

        ///  Set Your height to Textfiled
        hintText: hinttext,
        prefixText: '  ',
        hintStyle: TextStyle(color: Colors.grey.shade400),
        labelText: labeltext,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            bottom: 6,
          ),
          child: starticon,
        ),
        suffixIcon: lasticon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Color(0xffE5E7EB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Color(0xffE5E7EB)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Color(0xffE5E7EB)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.red),
        ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(30),
        //   borderSide: const BorderSide(color: Colors.amber),
        // )
        //   border: InputBorder.none,
        // prefixText: '    ',
      ),
    );
  }
}
