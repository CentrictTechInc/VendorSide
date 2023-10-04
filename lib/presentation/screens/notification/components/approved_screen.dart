import 'package:flutter/material.dart';
import 'package:vendor_app/app/extensions/buildcontext_extension.dart';
import 'package:vendor_app/app/utils/common_back_button.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';

class RequestAcceptedScreen extends StatelessWidget {
  const RequestAcceptedScreen({super.key});
  final bool approved = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: CommonBackButton(),
            ),
            VerticalSpacing(context.height / 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                approved
                    ? const ImageIcon(
                        AssetImage(RGIcons.confirm),
                        color: AppColors.primary,
                        size: 70,
                      )
                    : const ImageIcon(
                        AssetImage(RGIcons.cancel),
                        color: AppColors.red,
                        size: 70,
                      ),
                const VerticalSpacing(60),
                approved
                    ? const CommonText(
                        text: "YOUR REQUEST \n HAS BEEN APPROVED",
                        color: AppColors.primaryText,
                        fontSize: 20,
                        weight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      )
                    : const CommonText(
                        text: "YOUR REQUEST\n HAS BEEN DISAPPROVED",
                        color: AppColors.primaryText,
                        fontSize: 20,
                        weight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                const VerticalSpacing(15),
                const CommonText(
                  text:
                      "By Star Auto Service for Check engine light is on (general diagnosis)",
                  color: AppColors.grey,
                  fontSize: 12,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
