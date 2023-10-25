import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/chat/views/chat_screen_mobile.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    super.key,
    required this.document,
  });
  final DocumentSnapshot document;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Responsive(
              mobile: ChatMobileScreen(
                document: document,
              ),
              tablet: const ChatMobileScreen(),
              desktop: const ChatMobileScreen())),
    );
  }
}
