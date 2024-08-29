import 'package:flutter/material.dart';
import 'package:rideshare_app/core/config/service_locater.dart';
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/features/view/pages/Transport/cycle_details.dart';
import 'package:rideshare_app/features/view/widget/button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width - 25,
      padding: const EdgeInsets.all(10),
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('$feature1 | $feature2'),
              SizedBox(
                width: 150,
                height: 80,
                child: Image.network(
                  'https://$image',
                  headers: {
                    'Authorization':
                        'Bearer ${core.get<SharedPreferences>().getString('token')}'
                  },
                ),
              ),
            ],
          ),
          const Row(
            children: [Icon(Icons.location_on), Text('800m (5mins away)')],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonWidget(
                    title: AppString().BOOKLATER,
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CarImageSlider()));
                    },
                    color: Colors.black.withOpacity(0),
                    textColor: primaryColor,
                    borderColor: primaryColor,
                    width: MediaQuery.of(context).size.width / 2.5),
                ButtonWidget(
                    title: AppString().RIDENOW,
                    ontap: () {},
                    color: primaryColor,
                    textColor: white,
                    borderColor: primaryColor,
                    width: MediaQuery.of(context).size.width / 2.5),
              ],
            ),
          )
        ],
      ),
    );
  }
}
