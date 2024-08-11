import 'package:flutter/material.dart';
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_string.dart';

class CustomTabbar extends StatefulWidget {
  const CustomTabbar({super.key});

  @override
  State<CustomTabbar> createState() => _CustomTabbarState();
}

class _CustomTabbarState extends State<CustomTabbar>
    with SingleTickerProviderStateMixin {
  late final TabController tabBarController;
  List<Widget> tabs = [
    Text(TRANSPORT),
    Text(DELIVERY),
  ];

  @override
  void initState() {
    super.initState();
    tabBarController = TabController(
      length: 2,
      vsync: this,
    );
    tabBarController.addListener(() {
      tabBarController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TabBar(
          tabs: [
            Text(TRANSPORT),
            Text(DELIVERY),
          ],
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.white,
          unselectedLabelColor: titleColor,
          dividerColor: excellentColor,
          controller: tabBarController,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: darkPrimaryColor),
        ),
      ),
    );
  }
}
