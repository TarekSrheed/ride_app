import 'package:flutter/material.dart';
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_images.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/core/res/app_style.dart';
import 'package:rideshare_app/features/view/widget/avaiable_cycle_list.dart';
import 'package:rideshare_app/features/view/widget/button_widget.dart';

class SelectAvaiableCycleList extends StatelessWidget {
  SelectAvaiableCycleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              AVAIABLECYCLE,
              style: titleStyle,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text('18 cars found'),
            ),
            Expanded(
              child: ListView(
                children: [
                  AvaiableCycleList(
                    nameCycle: 'BMW',
                    feature1: 'auto',
                    feature2: '3seats',
                    image: facebookImage,
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
