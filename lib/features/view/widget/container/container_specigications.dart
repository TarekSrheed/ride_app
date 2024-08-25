
import 'package:flutter/material.dart';
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_style.dart';

class ContainerSpecifications extends StatelessWidget {
  const ContainerSpecifications({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });
  final String image;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.015),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image),
            Text(
              title,
              style: titleSpecifications,
            ),
            Text(
              subtitle,
              style: subTitleSpecifications,
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width * 0.15,
        height: MediaQuery.of(context).size.width * 0.15,
        decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          borderRadius: BorderRadius.circular(8),
          color: iconDisplayColor,
        ),
      ),
    );
  }
}
