import 'package:flutter/material.dart';
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_images.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/core/res/app_style.dart';
import 'package:rideshare_app/features/view/widget/button_widget.dart';
import 'package:rideshare_app/features/view/widget/container/container_list_tile.dart';

import 'package:rideshare_app/features/view/widget/text_from_fild_widget.dart';

class AddAmount extends StatelessWidget {
  AddAmount({super.key});
  TextEditingController enterController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AMOUNT),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFromFildWidget(
                controller: enterController,
                lableText: ENTERAMOUNT,
             ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  ADDPAYMENTMETHOD,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff304FFE),
                  ),
                ),
              ),
            ),
            Text(
              SELECTPAYMENTMETHOD,
              style: titleFavoStyle,
            ),
            ContainerListTile(
              subTilte: Text('Expires: 12/26'),
              title: Text('**** **** **** 8970'),
              leading: Image.asset(Payment),
            ),
            ContainerListTile(
              subTilte: Text('Expires: 12/26'),
              title: Text('Cash'),
              leading: Image.asset(Payment1),
            ),
            ContainerListTile(
              subTilte: Text('Expires: 12/26'),
              title: Text('mailaddress@mail.com'),
              leading: Image.asset(Payment2),
            ),
            ContainerListTile(
              subTilte: Text('Expires: 12/26'),
              title: Text('**** **** **** 8970'),
              leading: Image.asset(Payment3),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
            ),
            ButtonWidget(
              title: CONFIRM,
              ontap: () {},
              color: primaryColor,
              textColor: white,
              borderColor: primaryColor,
              size: MediaQuery.of(context).size.width - 20,
            ),
          ],
        ),
      ),
    );
  }
}
