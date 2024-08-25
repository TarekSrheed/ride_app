import 'package:flutter/material.dart';
<<<<<<< HEAD:lib/features/view/pages/sing_up_view.dart
import 'package:flutter/widgets.dart';

=======
>>>>>>> 754d5ae7bccc02137f2eb8df2fa5bc6f5d950513:lib/features/view/pages/authentication/sing_up_view.dart
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_images.dart';
import 'package:rideshare_app/features/view/pages/authentication/set_password_view.dart';
import 'package:rideshare_app/features/view/widget/button_widget.dart';
import 'package:rideshare_app/features/view/widget/container/container_singup_with.dart';

import 'package:rideshare_app/features/view/widget/intl_phone.dart';

import '../../../../core/res/app_string.dart';
import '../../../../core/res/app_style.dart';
import '../../widget/text_from_fild_widget.dart';

class SingUpView extends StatefulWidget {
  SingUpView({super.key});

  @override
  State<SingUpView> createState() => _SingUpViewState();
}

class _SingUpViewState extends State<SingUpView> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double paddingWidth = MediaQuery.of(context).size.width;
    double paddingHeight = MediaQuery.of(context).size.height;
    AppString appString = AppString();

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(appString.BACK),
        ),
        body: Padding(
          padding: EdgeInsets.all(paddingWidth * 0.02),
          child: ListView(
            children: [
              Text(
                appString.SIGNUPWITH,
                style: titleStyle,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFromFildWidget(
                  controller: userNameController,
                  lableText: appString.NAME,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 10.0),
              //   child: TextFromFildWidget(
              //     controller: emaillController,
              //     lableText: appString.EMAIL,
              //   ),
              // ),
              IntlPhoneFildWidget(phoneController: phoneController),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: DropdownButtonFormField(
                  items: ['male', 'female'].map((String val) {
                    return DropdownMenuItem(
                      value: val,
                      child: Text(
                        val,
                      ),
                    );
                  }).toList(),
                  onChanged: (val) {
                    genderController.text = val!;
                  },
                  decoration: InputDecoration(
                    labelText: appString.GENDER,
                    labelStyle: titleFavoStyle,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: darkPrimaryColor),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  appString.BYSIGININGUP,
                  style: subtitleStyle,
                ),
                leading: Icon(
                  Icons.check_circle_outline,
                  color: darkPrimaryColor,
                ),
              ),
              ButtonWidget(
                title: appString.SIGINUP,
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SetPasswordView(
                        userName: userNameController.text,
                        phone: phoneController.text,
                      ),
                    ),
                  );
                },
                color: darkPrimaryColor,
                textColor: white,
                borderColor: primaryColor,
                width: paddingWidth,
                height: paddingHeight,
              ),
              ContainerSingUpWithWidget(
                title: appString.SIGNUPWITHGMAIL,
                image: gmailImage,
              ),
              ContainerSingUpWithWidget(
                title: appString.SIGNUPWITHFACEBOOK,
                image: facebookImage,
              ),
              ContainerSingUpWithWidget(
                title: appString.SIGNUPWITHAPPLE,
                image: appleImage,
              ),
              Text(
                appString.ALREADYHAVE,
                style: titleStyle,
              )
            ],
          ),
        ));
  }
}
