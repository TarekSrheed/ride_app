import 'package:flutter/material.dart';

class TextFromFildWidget extends StatelessWidget {
  const TextFromFildWidget({
    this.suffixIcon,
    this.prefixIcon,
    required this.controller,
    required this.lableText,
    required this.lableStyle,
  });
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String lableText;
  final TextStyle lableStyle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            labelText: lableText,
            labelStyle: lableStyle,
            border: const OutlineInputBorder()),
      ),
    );
  }
}
