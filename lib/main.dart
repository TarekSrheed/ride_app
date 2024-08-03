import 'package:flutter/material.dart';
import 'package:rideshare_app/responive/desktop_body.dart';
import 'package:rideshare_app/responive/modile_body.dart';
import 'package:rideshare_app/responive/responive_layout.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponiveLayout(
      mobileBody: ModileBody(),
      desktopBody: DesktopBody(),
    );
  }
}
