
import 'package:flutter/widgets.dart';
import 'package:rideshare_app/core/res/app_style.dart';

class OnboardingColumn extends StatelessWidget {
  OnboardingColumn(
      {required this.image, required this.title, required this.subtitle});
  final String image;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        SizedBox(height: 30),
        Text(
          title,
          textAlign: TextAlign.center,
          style: titleStyle,
        ),
        SizedBox(height: 30),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: subtitleStyle,
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
