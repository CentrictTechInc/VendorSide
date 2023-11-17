import 'package:flutter/material.dart';
import 'package:vendor_app/app/extensions/buildcontext_extension.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/drawables.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget(
      {super.key, this.title = "No Vehicle's Found", this.subTitle = ""});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: context.height * 0.2),
              child: Image.asset(
                Drawables.noDataIcon,
                filterQuality: FilterQuality.medium,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            CommonText(
              text: title,
              fontSize: 18,
              weight: FontWeight.w400,
            ),
            const VerticalSpacing(10),
            CommonText(
              text: subTitle,
              fontSize: 20,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
