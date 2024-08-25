import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.title,
    required this.ontap,
    required this.color,
    required this.textColor,
    required this.borderColor,
    required this.width,
    required this.height,
  });
  final String title;
  final void Function() ontap;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(8),
            color: color),
        child: Text(
          title,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
