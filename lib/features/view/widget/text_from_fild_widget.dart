import 'package:flutter/material.dart';
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_style.dart';

class TextFromFildWidget extends StatelessWidget {
  const TextFromFildWidget({
    this.suffixIcon,
    this.prefixIcon,
    required this.controller,
    required this.lableText,
  });
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String lableText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          labelText: lableText,
          labelStyle: hintStyle,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: subTilteTwoColor, width: 2.0),
            borderRadius: BorderRadius.circular(8),
          ),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2.0),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
