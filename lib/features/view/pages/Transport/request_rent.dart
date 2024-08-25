import 'package:flutter/material.dart';
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_images.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/core/res/app_style.dart';
import 'package:rideshare_app/features/view/widget/button_widget.dart';
import 'package:rideshare_app/features/view/widget/container/container_list_tile.dart';

import 'package:rideshare_app/features/view/widget/list_tile/list_tile_request_rent.dart';

import 'package:rideshare_app/features/view/widget/text_from_fild_widget.dart';
import 'package:rideshare_app/features/view/widget/text_tilte.dart';

class RequestRent extends StatelessWidget {
  RequestRent({super.key});
  TextEditingController dataController = TextEditingController();
  TextEditingController timeController = TextEditingController();
    AppString appString = AppString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTileRequestRent(
                color: Colors.red,
                title: appString. CURRENTLOCATION,
                subTitle: '2972 Westheimer Rd. Santa Ana, Illinois 85486 ',
              ),
              ListTileRequestRent(
                color: primaryColor,
                title:  appString.CURRENTLOCATION,
                subTitle: '2972 Westheimer Rd. Santa Ana, Illinois 85486 ',
                trailing: '1.1Km',
              ),
              ContainerListTile(
                title: Text( appString.NAME),
                subTilte: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                    ),
                    Text('4.9 (531 reviews)'),
                  ],
                ),
              ),
              TextFromFildWidget(
                  controller: dataController,
                  lableText: appString. DATA,
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextFromFildWidget(
                    controller: timeController,
                    lableText:  appString.TIME,
                  ),
              ),
              TextTilte(
                text: appString. SELECTPAYMENTMETHOD,
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
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ButtonWidget(
                    title: appString. CONFIRMBOOKING,
                    ontap: () {},
                    color: primaryColor,
                    textColor: white,
                    borderColor: primaryColor,
                    size: MediaQuery.of(context).size.width - 70,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

