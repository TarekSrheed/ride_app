import 'package:flutter/material.dart';
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_images.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/core/res/app_style.dart';
import 'package:rideshare_app/features/view/widget/button_widget.dart';
import 'package:rideshare_app/features/view/widget/container/container_list_tile.dart';
import 'package:rideshare_app/features/view/widget/container/container_select_transport.dart';


class Wallet extends StatelessWidget {
  const Wallet({super.key});

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
                title: ADDMONEY,
                ontap: () {},
                color: Colors.black.withOpacity(0),
                textColor: primaryColor,
                borderColor: primaryColor,
                size: MediaQuery.of(context).size.width / 2 - 25,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                ContainerWithBorderWithBackground(
                  text: AVAIABLEBALANCE,
                  widget: Text(
                    '500',
                    style: nameStyle,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ContainerWithBorderWithBackground(
                  text: TOTALEXPEND,
                  widget: Text(
                    '200',
                    style: nameStyle,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TRANSECTINOS,
                  style: titleFavoStyle,
                ),
                Text(
                  SEEALL,
                  style: selectedNavigationBarStyle,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ContainerListTile(
                    subTilte: Text('Today at 09.20'),
                    title: Text('Welton'),
                    leading: Image.asset(up),
                    trailing: Text('570'),
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
