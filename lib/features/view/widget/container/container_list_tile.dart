
import 'package:flutter/material.dart';
import 'package:rideshare_app/core/res/app_color.dart';

class ContainerListTile extends StatelessWidget {
  ContainerListTile({
    super.key,
    this.trailing,
    this.leading,
    required this.subTilte,
    required this.title,
  });
  final Widget? trailing;
  final Widget? leading;
  final Widget subTilte;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(8),
        color: iconDisplayColor,
      ),
      child: ListTile(
        title: title,
        subtitle: subTilte,
        trailing: trailing,
        leading: leading,
      ),
    );
  }
}
