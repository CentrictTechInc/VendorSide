import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Size get mediaQuery => MediaQuery.of(this).size;
  double get height => mediaQuery.height;
  double get width => mediaQuery.width;
  EdgeInsets get mediaQueryPadding => MediaQuery.of(this).padding;
}
