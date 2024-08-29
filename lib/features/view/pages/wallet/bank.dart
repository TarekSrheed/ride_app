import 'package:flutter/material.dart';
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_images.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/features/view/widget/button_widget.dart';
import 'package:rideshare_app/features/view/widget/container/container_list_tile.dart';

import 'package:rideshare_app/features/view/widget/text_from_fild_widget.dart';

class Bank extends StatelessWidget {
  Bank({super.key});
  TextEditingController paymentMethodController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString().AMOUNT),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFromFildWidget(
              controller: paymentMethodController,
              lableText:AppString(). SELECTPAYMENTMETHOD,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFromFildWidget(
              controller: accountNumberController,
              lableText: AppString().ACCOUNTNUMBER,
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              title: AppString().SAVEPAYMENTMETHHOD,
              ontap: () {},
              color: primaryColor,
              textColor: white,
              borderColor: primaryColor,
              width: MediaQuery.of(context).size.width - 50,
            ),
            const SizedBox(
              height: 20,
            ),
            ContainerListTile(
              subTilte: const Text('Expires: 12/26'),
              title: const Text('**** **** **** 8970'),
              leading: Image.asset(Payment),
            ),
            ContainerListTile(
              subTilte: const Text('Expires: 12/26'),
              title: const Text('Cash'),
              leading: Image.asset(Payment1),
            ),
            ContainerListTile(
              subTilte: const Text('Expires: 12/26'),
              title: const Text('mailaddress@mail.com'),
              leading: Image.asset(Payment2),
            ),
            ContainerListTile(
              subTilte: const Text('Expires: 12/26'),
              title: const Text('**** **** **** 8970'),
              leading: Image.asset(Payment3),
            ),
          ],
        ),
      ),
    );
  }
}
