import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/presentation/screens/notification/views/notification_screen_mobile.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Responsive(
            mobile: NoficationScreenMobile(),
            tablet: NoficationScreenMobile(),
            desktop: NoficationScreenMobile()));
  }
}
