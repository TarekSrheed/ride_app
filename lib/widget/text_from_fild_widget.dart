import 'package:flutter/material.dart';

class TextFromFildWidget extends StatelessWidget {
  TextFromFildWidget({
    this.suffixIcon,
    this.prefixIcon,
    required this.controller,
    required this.hintText,
  });
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hintText,
            border: OutlineInputBorder()),
      ),
    );
  }
}
