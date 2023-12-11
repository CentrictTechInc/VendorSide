import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:vendor_app/app/app.dart';

enum ToastType { warn, error, info, success }

class ToastMessage {
  static message(String message, {ToastType type = ToastType.error}) {
    final ScaffoldMessengerState scaffold = scaffoldKey.currentState!;
    scaffold.clearSnackBars();
    scaffold.showSnackBar(SnackBar(
      margin: const EdgeInsets.only(top: 50.0),
      content: AwesomeSnackbarContent(
        title: type == ToastType.error
            ? "Error"
            : type == ToastType.warn
                ? "Warning"
                : type == ToastType.success
                    ? "Success"
                    : "Info",
        message: message,
        // color: type == ToastType.error
        //     ? AppColors.red
        //     : type == ToastType.warn
        //         ? AppColors.
        //         : type == ToastType.success
        //             ? AppColors.primary
        //             : AppColors.blue,
        // inMaterialBanner: true,
        messageFontSize: 14.0,
        contentType: type == ToastType.error
            ? ContentType.failure
            : type == ToastType.warn
                ? ContentType.warning
                : type == ToastType.success
                    ? ContentType.success
                    : ContentType.help,
      ),
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 2),
    ));
  }
}
