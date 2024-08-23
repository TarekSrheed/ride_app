import 'package:flutter/material.dart';
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_style.dart';
import 'package:rideshare_app/features/view/pages/authentication/Complete_your_profile_view.dart';
import 'package:rideshare_app/features/view/widget/button_widget.dart';
import 'package:rideshare_app/features/view/widget/text_from_fild_widget.dart';

import '../../../../core/res/app_string.dart';

class SetPasswordView extends StatelessWidget {
  SetPasswordView({super.key});
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          BACK,
          style: titleStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  SETPASSWORD,
                  style: titleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Center(
                  child: Text(
                    SETYOURPASSWORD,
                    style: subtitleStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFromFildWidget(
                  controller: passwordController,
                  lableText: ENTERYOURPASSWORD,
                  
                  suffixIcon: Icon(Icons.visibility_off_outlined),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFromFildWidget(
                  controller: confirmeController,
                  lableText: CONFIRMPASSWORD,
                  
                  suffixIcon: Icon(Icons.visibility_off_outlined),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: Text(
                  ATLEAST,
                  style: subtitleStyle,
                ),
              ),
              ButtonWidget(
                  title: REGISTER,
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CompleteYourProfile();
                        },
                      ),
                    );
                  },
                  color: darkPrimaryColor,
                  textColor: white,
                  borderColor: darkPrimaryColor,
                  size: MediaQuery.of(context).size.width)
            ],
          ),
        ),
      ),
    );
  }
}
