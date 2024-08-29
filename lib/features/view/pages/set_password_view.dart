import 'package:flutter/material.dart';
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/core/res/app_style.dart';
import 'package:rideshare_app/features/view/pages/Complete_your_profile_view.dart';
import 'package:rideshare_app/features/view/widget/button_widget.dart';
import 'package:rideshare_app/features/view/widget/text_from_fild_widget.dart';

class SetPasswordView extends StatelessWidget {
  SetPasswordView({super.key});
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        AppString().  BACK,
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
               AppString().   SETPASSWORD,
                  style: titleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Center(
                  child: Text(
                   AppString(). SETYOURPASSWORD,
                    style: subtitleStyle,
                  ),
                ),
              ),
              TextFromFildWidget(
                controller: passwordController,
                lableText:AppString(). ENTERYOURPASSWORD,
               
                suffixIcon: const Icon(Icons.visibility_off_outlined),
              ),
              TextFromFildWidget(
                controller: confirmeController,
                lableText:AppString(). CONFIRMPASSWORD,
               
                suffixIcon: const Icon(Icons.visibility_off_outlined),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: Text(
                 AppString(). ATLEAST,
                  style: subtitleStyle,
                ),
              ),
              ButtonWidget(
                title:AppString(). REGISTER,
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
                width: MediaQuery.of(context).size.width,
               
              )
            ],
          ),
        ),
      ),
    );
  }
}
