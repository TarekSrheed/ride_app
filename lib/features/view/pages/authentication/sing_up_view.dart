import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
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
  TextEditingController nameController = TextEditingController();
  TextEditingController emaillController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double paddingWidth = MediaQuery.of(context).size.width;
    double paddingHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(BACK),
        ),
        body: Padding(
          padding: EdgeInsets.all(paddingWidth * 0.02),
          child: ListView(
            children: [
              Text(
                SIGNUPWITH,
                style: titleStyle,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFromFildWidget(
                  controller: nameController,
                  lableText: NAME,
                  
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFromFildWidget(
                  controller: emaillController,
                  lableText: EMAIL,
                  
                ),
              ),
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
                    print(genderController.text);
                  },
                  decoration: InputDecoration(
                    labelText: GENDER,
                    labelStyle: titleFavoStyle,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: darkPrimaryColor)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  BYSIGININGUP,
                  style: subtitleStyle,
                ),
                leading: Icon(
                  Icons.check_circle_outline,
                  color: darkPrimaryColor,
                ),
              ),
              ButtonWidget(
                title: SIGINUP,
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SetPasswordView(),
                      ));
                },
                color: darkPrimaryColor,
                textColor: white,
                borderColor: primaryColor,
                size: paddingWidth,
              ),
              ContainerSingUpWithWidget(
                title: SIGNUPWITHGMAIL,
                image: gmailImage,
              ),
              ContainerSingUpWithWidget(
                title: SIGNUPWITHFACEBOOK,
                image: facebookImage,
              ),
              ContainerSingUpWithWidget(
                title: SIGNUPWITHAPPLE,
                image: appleImage,
              ),
              Text(
                ALREADYHAVE,
                style: titleStyle,
              )
            ],
          ),
        ));
  }
}
