import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:rideshare_app/features/view/pages/sing_up_view.dart';
import 'package:rideshare_app/features/view/widget/button_widget.dart';

import '../../../core/res/app_color.dart';
import '../../../core/res/app_string.dart';
import '../../../core/res/app_style.dart';
import '../widget/text_from_fild_widget.dart';

class CompleteYourProfile extends StatelessWidget {
  CompleteYourProfile({super.key});
  TextEditingController NameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emaillController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PROFILE),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
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
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextFromFildWidget(
              controller: NameController,
              lableText: FULLNAME,
              lableStyle: titleFavoStyle,
            ),
            IntlPhoneFildWidget(
              phoneController: phoneController,
            ),
            TextFromFildWidget(
              controller: emaillController,
              lableText: EMAIL,
              lableStyle: titleFavoStyle,
            ),
            TextFromFildWidget(
              controller: streetController,
              lableText: STREET,
              lableStyle: titleFavoStyle,
            ),
            TextFromFildWidget(
              controller: streetController,
              lableText: CITY,
              lableStyle: titleFavoStyle,
              suffixIcon: IconButton(
                icon: Icon(Icons.keyboard_arrow_down),
                onPressed: () {},
              ),
            ),
            TextFromFildWidget(
              controller: streetController,
              lableText: DISTRICT,
              lableStyle: titleFavoStyle,
              suffixIcon: IconButton(
                icon: Icon(Icons.keyboard_arrow_down),
                onPressed: () {},
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                    title: CANCEL,
                    ontap: () {},
                    color: darkPrimaryColor.withOpacity(0),
                    textColor: titleColor,
                    borderColor: darkPrimaryColor,
                    size: MediaQuery.of(context).size.width * 0.4),
                SizedBox(
                  width: 15,
                ),
                ButtonWidget(
                    title: SAVE,
                    ontap: () {},
                    color: darkPrimaryColor,
                    textColor: white,
                    borderColor: darkPrimaryColor,
                    size: MediaQuery.of(context).size.width * 0.4),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
