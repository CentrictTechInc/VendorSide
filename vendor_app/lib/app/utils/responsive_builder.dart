import 'package:flutter/material.dart';
import 'package:vendor_app/app/extensions/buildcontext_extension.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;

  final Widget tablet;

  final Widget desktop;

  const Responsive(
      {Key? key,
      required this.mobile,
      required this.tablet,
      required this.desktop})
      : super(key: key);

  static isMobile(BuildContext context) => context.width < 599;

  static isTablet(BuildContext context) =>
      context.width < 1400 && context.width > 600;

  static isDesktop(BuildContext context) => context.width >= 1400;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1400) {
        return desktop;
      } else if (constraints.maxWidth >= 600) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}
