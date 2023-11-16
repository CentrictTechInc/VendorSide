import 'package:flutter/material.dart';
import 'package:vendor_app/app/app_router.dart';

class ShowDialogBox {
  static bool isOpen = false;
  static showDialogBoxs(
    bool dismisss,
  ) {
    isOpen = true;
    return showDialog(
        barrierColor: Colors.transparent,
        context: globalContext!,
        barrierDismissible: dismisss,
        builder: (context) {
          isOpen = true;
          return Container(
            width: 130,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            height: 130,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(Assets.loader,
                //     fit: BoxFit.fill, width: 100, height: 100)
                CircularProgressIndicator(),
              ],
            ),
          );
        }).then((value) {
      isOpen = false;
    });
  }
}
