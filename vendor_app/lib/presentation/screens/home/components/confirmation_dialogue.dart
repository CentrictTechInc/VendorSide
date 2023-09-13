import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';

class CloseConfirmationDialogue extends StatelessWidget {
  const CloseConfirmationDialogue({super.key, this.contentText});
  final String? contentText;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const CommonText(
        text: "Confirm",
        fontSize: 24,
      ),
      content: CommonText(
        text: contentText ?? "Are you sure you want to close?",
        fontSize: 16,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // Close the dialog and perform the closing action
            Navigator.of(context).pop(true);
          },
          child: const CommonText(
            text: "Yes",
            fontSize: 18,
            color: AppColors.grey,
          ),
        ),
        TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.primary)),
          onPressed: () {
            // Close the dialog without performing the closing action
            Navigator.of(context).pop(false);
          },
          child: const CommonText(
            text: "No",
            fontSize: 18,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
