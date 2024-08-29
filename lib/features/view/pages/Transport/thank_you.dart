import 'package:flutter/material.dart';
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_images.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/features/view/widget/button_widget.dart';
import 'package:rideshare_app/features/view/widget/text_tilte.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(thank),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: TextTilte(text: AppString().THANKYOU),
            ),
            Text(AppString().YOURBOOKINGHAS),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
            ),
            ButtonWidget(
              title: AppString().CONFIRMBOOKING,
              ontap: () {},
              color: primaryColor,
              textColor: white,
              borderColor: primaryColor,
              width: MediaQuery.of(context).size.width - 20,
            ),
          ],
        ),
      ),
    );
  }
}
