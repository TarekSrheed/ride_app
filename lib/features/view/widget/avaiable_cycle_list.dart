
import 'package:flutter/material.dart';
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/features/view/widget/button_widget.dart';

class AvaiableCycleList extends StatelessWidget {
  AvaiableCycleList({
    super.key,
    required this.nameCycle,
    required this.feature1,
    required this.feature2,
    required this.image,
  });

  final String nameCycle;
  final String feature1;
  final String feature2;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width - 25,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(8),
        color: iconDisplayColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(nameCycle),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$feature1 |  $feature2'),
              Image.asset(image),
            ],
          ),
          Row(
            children: [Icon(Icons.location_on), Text('800m (5mins away)')],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                    title: BOOKLATER,
                    ontap: () {},
                    color: Colors.black.withOpacity(0),
                    textColor: primaryColor,
                    borderColor: primaryColor,
                    size: MediaQuery.of(context).size.width / 2 - 40),
                ButtonWidget(
                    title: RIDENOW,
                    ontap: () {},
                    color: primaryColor,
                    textColor: white,
                    borderColor: primaryColor,
                    size: MediaQuery.of(context).size.width / 2 - 40),
              ],
            ),
          )
        ],
      ),
    );
  }
}
