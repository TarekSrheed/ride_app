// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_style.dart';
import 'package:rideshare_app/features/view/pages/authentication/Complete_your_profile_view.dart';
import 'package:rideshare_app/features/view/widget/button_widget.dart';
import 'package:rideshare_app/features/view/widget/text_from_fild_widget.dart';

import '../../../../core/res/app_string.dart';

class SetPasswordView extends StatelessWidget {
  String userName;
  String phone;
  SetPasswordView({
    Key? key,
    required this.userName,
    required this.phone,
  }) : super(key: key);
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString().BACK,
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
                  AppString().SETPASSWORD,
                  style: titleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Center(
                  child: Text(
                    AppString().SETYOURPASSWORD,
                    style: subtitleStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFromFildWidget(
                  controller: passwordController,
                  lableText: AppString().ENTERYOURPASSWORD,
                  suffixIcon: const Icon(Icons.visibility_off_outlined),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFromFildWidget(
                  controller: confirmeController,
                  lableText: AppString().CONFIRMPASSWORD,
                  suffixIcon: Icon(Icons.visibility_off_outlined),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: Text(
                  AppString().ATLEAST,
                  style: subtitleStyle,
                ),
              ),
              ButtonWidget(
                title: AppString().REGISTER,
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CompleteYourProfile(
                          password: passwordController.text,
                          confirmPassword: confirmeController.text,
                          userName: userName,
                          phone: phone,
                        );
                      },
                    ),
                  );
                },
                color: darkPrimaryColor,
                textColor: white,
                borderColor: darkPrimaryColor,
                size: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
