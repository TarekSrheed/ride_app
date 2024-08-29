import 'package:flutter/material.dart';
import 'package:rideshare_app/features/view/widget/button_widget.dart';
import 'package:rideshare_app/features/view/widget/intl_phone.dart';

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
        title: Text(AppString().PROFILE),
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
              lableText:AppString(). FULLNAME,
             
            ),
            IntlPhoneFildWidget(
              phoneController: phoneController,
            ),
            TextFromFildWidget(
              controller: emaillController,
              lableText:AppString(). EMAIL,
             
            ),
            TextFromFildWidget(
              controller: streetController,
              lableText:AppString(). STREET,
             
            ),
            TextFromFildWidget(
              controller: streetController,
              lableText:AppString(). CITY,
             
              suffixIcon: IconButton(
                icon: const Icon(Icons.keyboard_arrow_down),
                onPressed: () {},
              ),
            ),
            TextFromFildWidget(
              controller: streetController,
              lableText:AppString(). DISTRICT,
             
              suffixIcon: IconButton(
                icon: const Icon(Icons.keyboard_arrow_down),
                onPressed: () {},
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  title:AppString(). CANCEL,
                  ontap: () {},
                  color: darkPrimaryColor.withOpacity(0),
                  textColor: titleColor,
                  borderColor: darkPrimaryColor,
                  width: MediaQuery.of(context).size.width * 0.4,
                 
                ),
                const SizedBox(
                  width: 15,
                ),
                ButtonWidget(
                    title:AppString(). SAVE,
                    ontap: () {},
                    color: darkPrimaryColor,
                    textColor: white,
                    borderColor: darkPrimaryColor,
                    width: MediaQuery.of(context).size.width * 0.4,
                 ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}