import 'package:flutter/material.dart';
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/core/res/app_style.dart';
import 'package:rideshare_app/features/view/widget/button_widget.dart';
import 'package:rideshare_app/features/view/widget/intl_phone.dart';
import 'package:rideshare_app/features/view/widget/text_from_fild_widget.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString().PROFILE),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 90,
                    backgroundColor: hintColor,
                  ),
                  Positioned(
                    top: 125,
                    left: 125,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: darkPrimaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset('assets/images/Camera.png'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Monzer Albarbary',
                style: titleStyle,
              ),
            ),
            TextFromFildWidget(
                controller: emailController,
                lableText: AppString().EMAIL,
             ),
            IntlPhoneFildWidget(
              phoneController: phoneController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20),
              child: TextFromFildWidget(
                  controller: addressController,
                  lableText: AppString().ADDRESS,
                ),
            ),
            ButtonWidget(
                title: AppString().LOGOUT,
                ontap: () {},
                color: white,
                textColor: primaryColor,
                borderColor: primaryColor,
                width: MediaQuery.sizeOf(context).width - 100)
          ],
        ),
      ),
    );
  }
}
