import 'package:flutter/material.dart';
import 'package:vendor_app/app/extensions/buildcontext_extension.dart';
import 'package:vendor_app/app/utils/common_appbar.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/tasks/components/tab_button.dart';

class TasksMobileScreen extends StatelessWidget {
  TasksMobileScreen({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonAppBar(
          backButton: false,
          hamburger: true,
          text: "Tasks",
          onDrawerPressed: onPressed,
          hideBell: true,
        ),
        const VerticalSpacing(10),
        Container(
            width: context.width,
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: AppColors.whiteGreyish),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: tabs,
                ),
              ),
            ))
      ],
    );
  }

  final List<TabButton> tabs = [
    TabButton(name: "tasks", onPressed: () {}, highlighted: true)
  ];
}
