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

class SingInView extends StatefulWidget {
  SingInView({super.key});

  @override
  State<SingInView> createState() => _SingInViewState();
}

class _SingInViewState extends State<SingInView> {
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
                  lableText: EMAILORPHONE,
                  
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFromFildWidget(
                  controller: emaillController,
                  lableText: ENTER,
                  
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ButtonWidget(
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
                DONTHAVE,
                style: titleStyle,
              )
            ],
          ),
        ));
  }
}
