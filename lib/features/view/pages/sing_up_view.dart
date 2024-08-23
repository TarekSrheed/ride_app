import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_images.dart';
import 'package:rideshare_app/features/view/pages/set_password_view.dart';
import 'package:rideshare_app/features/view/widget/button_widget.dart';
import 'package:rideshare_app/features/view/widget/container_singup_with.dart';
import 'package:rideshare_app/features/view/widget/intl_phone.dart';

import '../../../core/res/app_string.dart';
import '../../../core/res/app_style.dart';
import '../widget/text_from_fild_widget.dart';

class SingUpView extends StatefulWidget {
  const SingUpView({super.key});

  @override
  State<SingUpView> createState() => _SingUpViewState();
}

class _SingUpViewState extends State<SingUpView> {
  TextEditingController phone = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController birthDate = TextEditingController();

  TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double paddingWidth = MediaQuery.of(context).size.width;
    double paddingHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(AppString().BACK),
        ),
        body: Padding(
          padding: EdgeInsets.all(paddingWidth * 0.02),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
              AppString().    SIGNUPWITH,
                  style: titleStyle,
                ),
                TextFromFildWidget(
                  controller: userName,
                  lableText:AppString(). USERNAME,
                  lableStyle: titleFavoStyle,
                ),
                IntlPhoneFildWidget(phoneController: phone),
                TextFromFildWidget(
                  controller: birthDate,
                  lableText:AppString(). BIRTHDATE,
                  lableStyle: titleFavoStyle,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
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
                      labelText:AppString(). GENDER,
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
                AppString().    BYSIGININGUP,
                    style: subtitleStyle,
                  ),
                  leading: Icon(
                    Icons.check_circle_outline,
                    color: darkPrimaryColor,
                  ),
                ),
                ButtonWidget(
                  title:AppString(). SIGINUP,
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
                // ContainerSingUpWithWidget(
                //   title: SIGNUPWITHGMAIL,
                //   image: gmailImage,
                // ),
                // ContainerSingUpWithWidget(
                //   title: SIGNUPWITHFACEBOOK,
                //   image: facebookImage,
                // ),
                // ContainerSingUpWithWidget(
                //   title: SIGNUPWITHAPPLE,
                //   image: appleImage,
                // ),
                Text(
            AppString().      ALREADYHAVE,
                  style: signUpWithStyle,
                )
              ],
            ),
          ),
        ));
  }
}
