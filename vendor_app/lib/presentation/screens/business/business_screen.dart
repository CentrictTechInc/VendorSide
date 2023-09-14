import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';

class BusinessScreen extends StatelessWidget {
  BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Responsive(
            mobile: Text("hello"),
            tablet: Text("hello"),
            desktop: Text("hello")));
  }
}
