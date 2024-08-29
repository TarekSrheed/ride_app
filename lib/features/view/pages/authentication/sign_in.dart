import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare_app/core/bloc_manager/app_manager_bloc.dart';

import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_images.dart';
import 'package:rideshare_app/features/data/model/login_model/login_user_model.dart';
import 'package:rideshare_app/features/data/model/login_model/user_model.dart';
import 'package:rideshare_app/features/view/bloc/auth_bloc/auth_bloc.dart';
import 'package:rideshare_app/features/view/pages/authentication/set_password_view.dart';
import 'package:rideshare_app/features/view/widget/button_widget.dart';
import 'package:rideshare_app/features/view/widget/container/container_singup_with.dart';

import '../../../../core/res/app_string.dart';
import '../../../../core/res/app_style.dart';
import '../../widget/text_from_fild_widget.dart';

class SingInView extends StatefulWidget {
  SingInView({super.key});

  @override
  State<SingInView> createState() => _SingInViewState();
}

class _SingInViewState extends State<SingInView> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double paddingWidth = MediaQuery.of(context).size.width;
    double paddingHeight = MediaQuery.of(context).size.height;
    AppString appString = AppString();

    return Scaffold(
        appBar: AppBar(
          title: Text(appString.BACK),
        ),
        body: Padding(
          padding: EdgeInsets.all(paddingWidth * 0.02),
          child: ListView(
            children: [
              // Text(
              //   appString.SIGNUINWITH,
              //   style: titleStyle,
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFromFildWidget(
                  controller: phoneController,
                  lableText: appString.EMAILORPHONE,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFromFildWidget(
                  controller: passwordController,
                  lableText: appString.ENTERYOURPASSWORD,
                ),
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
                    title: appString.SIGINUP,
                    ontap: () {
                      context.read<AuthBloc>().add(
                            Login(
                              user: LoginUserModel(
                                phone: phoneController.text,
                                password: passwordController.text,
                              ),
                            ),
                          );
                    },
                    color: darkPrimaryColor,
                    textColor: white,
                    borderColor: darkPrimaryColor,
                    width: MediaQuery.of(context).size.width * 0.4),
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
                appString.DONTHAVE,
                style: titleStyle,
              )
            ],
          ),
        ));
  }
}
