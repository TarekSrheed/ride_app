import 'package:flutter/material.dart';

class ResponiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;

  const ResponiveLayout(
      {super.key, required this.mobileBody, required this.desktopBody});

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 750;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 750 &&
      MediaQuery.of(context).size.width < 1200;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;
  static bool isDesktopWithoutDrawar(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1600;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return desktopBody;
        } else {
          return mobileBody;
        }
      },
    );
  }
}
