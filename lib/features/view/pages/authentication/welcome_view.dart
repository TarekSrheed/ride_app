import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare_app/core/bloc_manager/app_manager_bloc.dart';

import 'package:rideshare_app/features/view/pages/authentication/sing_up_view.dart';

import '../../../../core/res/app_color.dart';
import '../../../../core/res/app_string.dart';
import '../../../../core/res/app_style.dart';
import '../../widget/button_widget.dart';

class WelcomView extends StatelessWidget {
  WelcomView({super.key});

  @override
  Widget build(BuildContext context) {
    double paddingWidth = MediaQuery.of(context).size.width;
    double paddingHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(paddingWidth * 0.02),
        child: Column(
          children: [
            // Padding(
            //     padding: EdgeInsets.only(
            //         top: paddingHeight * 0.1, bottom: paddingHeight * 0.03),
            //     child: Image.asset('images/Welcome.png')),
            Text(
              AppString().WELCOME,
              style: titleStyle,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: paddingHeight * 0.03, bottom: paddingHeight * 0.25),
              child: Text(
                AppString().HAVEAETTER,
                style: subtitleStyle,
              ),
            ),
            ButtonWidget(
              borderColor: darkPrimaryColor,
              color: darkPrimaryColor,
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SingUpView(),
                    ));
              },
              size: MediaQuery.of(context).size.width,
              textColor: white,
              title: AppString().CREATE,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: paddingHeight * 0.001, top: paddingHeight * 0.03),
              child: ButtonWidget(
                borderColor: darkPrimaryColor,
                color: Colors.black.withOpacity(0),
                ontap: () {
                  //remove
                  context.read<AppManagerBloc>().add(LogOut());
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => SingUpView(),
                  //     ));
                },
                size: MediaQuery.of(context).size.width,
                textColor: darkPrimaryColor,
                title: AppString().LOGIN,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
