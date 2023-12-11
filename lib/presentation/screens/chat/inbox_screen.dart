import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/presentation/screens/chat/views/inbox_mobile.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Responsive(
            mobile: InboxMobileScreen(),
            tablet: InboxMobileScreen(),
            desktop: InboxMobileScreen()));
  }
}
