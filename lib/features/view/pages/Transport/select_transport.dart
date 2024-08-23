import 'package:flutter/material.dart';
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_images.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rideshare_app/core/res/app_style.dart';
import 'package:rideshare_app/features/view/widget/container/container_select_transport.dart';


class SelectTransport extends StatelessWidget {
  SelectTransport();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Grid'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ContainerWithBorderWithBackground(
                  widget: Image.asset(car, width: 80, height: 80),
                  text: CAR,
                ),
                ContainerWithBorderWithBackground(
                  widget: Image.asset(bike, width: 80, height: 80),
                  text: BIKE,
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ContainerWithBorderWithBackground(
                  widget: Image.asset(cycle, width: 80, height: 80),
                  text: CYCLE,
                ),
                ContainerWithBorderWithBackground(
                  widget: Image.asset(taxi, width: 80, height: 80),
                  text: TAXI,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
