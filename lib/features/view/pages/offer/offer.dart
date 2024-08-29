import 'package:flutter/material.dart';
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/core/res/app_style.dart';
import 'package:rideshare_app/features/view/widget/button_widget.dart';
import 'package:rideshare_app/features/view/widget/container/container_drwer.dart';

class Offer extends StatelessWidget {
  const Offer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString().OFFER),
        centerTitle: true,
        leading: ContainerDrwer(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 15),
              child: ListTile(
                title: Text(
                  '15% off',
                  style: titleOfferStyle,
                ),
                subtitle: Text(
                  'asfd',
                  style: subtitleStyle,
                ),
                trailing: ButtonWidget(
                    title: AppString().COLLECT,
                    ontap: () {},
                    color: primaryColor,
                    textColor: white,
                    borderColor: primaryColor,
                    width: MediaQuery.sizeOf(context).width / 4),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
            );
          },
        ),
      ),
    );
  }
}
