import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/network_image_with_initials.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/chat/chat_screen.dart';

class MessageCard extends StatelessWidget {
  const MessageCard(
      {super.key,
      required this.document,
      required this.name,
      required this.messageText,
      required this.imageUrl,
      required this.time,
      this.isRead = false});

  final String name;
  final String messageText;
  final String imageUrl;
  final String time;
  final bool isRead;
  final DocumentSnapshot document;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(
                document: document,
              ),
            ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(color: AppColors.grey.withOpacity(0.2), blurRadius: 2.0),
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: NetWorkImageWithInitials(
                backgroundColor: AppColors.whiteGreyish,
                textColor: AppColors.primaryText,
                imageUrl: imageUrl,
                name: name[0],
                cacheHeight: 65,
                radius: 1,
                fit: BoxFit.scaleDown,
              ),
            ),
            const HorizontalSpacing(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: CommonText(
                      text: time,
                      fontSize: 12,
                      color: AppColors.grey,
                      weight: isRead ? FontWeight.w300 : FontWeight.w600,
                    ),
                  ),
                  const VerticalSpacing(4),
                  CommonText(
                    text: data['userName'],
                    fontSize: 14,
                    textOverflow: TextOverflow.ellipsis,
                    weight: isRead ? FontWeight.w300 : FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                  const VerticalSpacing(10),
                  CommonText(
                    text: messageText,
                    fontSize: 12,
                    textOverflow: TextOverflow.ellipsis,
                    color: AppColors.grey,
                    weight: isRead ? FontWeight.w300 : FontWeight.w600,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
