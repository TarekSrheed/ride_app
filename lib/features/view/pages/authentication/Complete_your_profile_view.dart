// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare_app/core/bloc_manager/app_manager_bloc.dart';
import 'package:rideshare_app/features/data/model/login_model/user_model.dart';
import 'package:rideshare_app/features/view/bloc/auth_bloc/auth_bloc.dart';

import 'package:rideshare_app/features/view/pages/authentication/sing_up_view.dart';
import 'package:rideshare_app/features/view/widget/button_widget.dart';
import 'package:rideshare_app/features/view/widget/intl_phone.dart';

import '../../../../core/res/app_color.dart';
import '../../../../core/res/app_string.dart';
import '../../../../core/res/app_style.dart';
import '../../widget/text_from_fild_widget.dart';

class CompleteYourProfile extends StatelessWidget {
  String phone;
  String userName;
  String confirmPassword;
  String password;

  CompleteYourProfile({
    Key? key,
    required this.phone,
    required this.userName,
    required this.confirmPassword,
    required this.password,
  }) : super(key: key);
  TextEditingController dateController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  AppString appString = AppString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appString.PROFILE),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextFromFildWidget(
                controller: firstNameController,
                lableText: appString.FIRSTNAME,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextFromFildWidget(
                controller: lastNameController,
                lableText: appString.LASTNAME,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10.0),
            //   child: TextFromFildWidget(
            //     controller: streetController,
            //     lableText: appString.STREET,
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10.0),
            //   child: TextFromFildWidget(
            //     controller: streetController,
            //     lableText: appString.CITY,
            //     suffixIcon: IconButton(
            //       icon: Icon(Icons.keyboard_arrow_down),
            //       onPressed: () {},
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10.0),
            //   child: TextFromFildWidget(
            //     controller: streetController,
            //     lableText: DISTRICT,
            //     suffixIcon: IconButton(
            //       icon: Icon(Icons.keyboard_arrow_down),
            //       onPressed: () {},
            //     ),
            //   ),
            // ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                    title: appString.CANCEL,
                    ontap: () {},
                    color: darkPrimaryColor.withOpacity(0),
                    textColor: titleColor,
                    borderColor: darkPrimaryColor,
                    size: MediaQuery.of(context).size.width * 0.4),
                SizedBox(
                  width: 15,
                ),
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is SuccessToLogIn) {
                      context.read<AppManagerBloc>().add(Success());
                    }
                    if (state is FailedToLogIn) {
                      context.read<AppManagerBloc>().add(Failed());
                    }
                  },
                  child: ButtonWidget(
                      title: AppString().SAVE,
                      ontap: () {
                        context.read<AuthBloc>().add(
                              SignUp(
                                user: UserModel(
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  phone: phone,
                                  username: userName,
                                  birthDate: dateController.text,
                                  password: password,
                                  confirmPassword: confirmPassword,
                                ),
                              ),
                            );
                      },
                      color: darkPrimaryColor,
                      textColor: white,
                      borderColor: darkPrimaryColor,
                      size: MediaQuery.of(context).size.width * 0.4),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
