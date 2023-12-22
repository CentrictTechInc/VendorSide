import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ContextExtension on BuildContext {
  Size get mediaQuery => MediaQuery.of(this).size;
  double get height => mediaQuery.height;
  double get width => mediaQuery.width;
  EdgeInsets get mediaQueryPadding => MediaQuery.of(this).padding;
}

extension StringFormatting on String {
  String toNewFormat() {
    final dateTime = DateTime.parse(this);
    final newFormat = DateFormat('yyyy-MM-dd');
    return newFormat.format(dateTime);
  }
}

extension DateTimeFormatting on DateTime {
  String toNewFormat() {
    final newFormat = DateFormat('yyyy-MM-dd');
    return newFormat.format(this);
  }
}
