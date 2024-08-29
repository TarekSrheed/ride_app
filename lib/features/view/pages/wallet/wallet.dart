import 'package:flutter/material.dart';
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_images.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/core/res/app_style.dart';
import 'package:rideshare_app/features/view/widget/button_widget.dart';
import 'package:rideshare_app/features/view/widget/container/container_list_tile.dart';
import 'package:rideshare_app/features/view/widget/container/container_select_transport.dart';


class Wallet extends StatelessWidget {
   Wallet({super.key});
  final  AppString appString = AppString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: ButtonWidget(
                title:  appString.ADDMONEY,
                ontap: () {},
                color: Colors.black.withOpacity(0),
                textColor: primaryColor,
                borderColor: primaryColor,
                width: MediaQuery.of(context).size.width / 2 - 25,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                ContainerWithBorderWithBackground(
                  text: appString. AVAIABLEBALANCE,
                  widget: Text(
                    '500',
                    style: nameStyle,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ContainerWithBorderWithBackground(
                  text: appString. TOTALEXPEND,
                  widget: Text(
                    '200',
                    style: nameStyle,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                 appString.  TRANSECTINOS,
                  style: titleFavoStyle,
                ),
                Text(
                 appString.  SEEALL,
                  style: selectedNavigationBarStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ContainerListTile(
                    subTilte: const Text('Today at 09.20'),
                    title: const Text('Welton'),
                    leading: Image.asset(up),
                    trailing: const Text('570'),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
