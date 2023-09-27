import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/common_appbar.dart';

class ScheduleMobileScreen extends StatelessWidget {
  const ScheduleMobileScreen({this.onPressed, super.key});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CommonAppBar(
            backButton: false,
            hamburger: true,
            text: "Tasks",
            onDrawerPressed: onPressed,
            hideBell: true,
          ),
        ],
      ),
    );
  }
}
