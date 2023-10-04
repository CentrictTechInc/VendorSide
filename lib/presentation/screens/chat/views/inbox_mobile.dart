import 'package:flutter/material.dart';
import 'package:vendor_app/app/extensions/buildcontext_extension.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/common/resources/colors.dart';

class ChatUsers {
  String name;
  String messageText;
  String image;
  String time;
  ChatUsers(
      {required this.name,
      required this.messageText,
      required this.image,
      required this.time});
}

class InboxMobileScreen extends StatelessWidget {
  InboxMobileScreen({super.key});
  final int currentUser = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(maxWidth: context.width, maxHeight: context.height),
      child: Column(
        children: [
          const VerticalSpacing(10),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: 400,
                constraints: BoxConstraints(maxHeight: context.height),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: AppColors.greyish),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                // child: StreamBuilder<QuerySnapshot>(
                //     stream: FirebaseFirestore.instance
                //         .collection('users')
                //         .snapshots(),
                //     builder: (context, snapshot) {
                //       if (snapshot.connectionState == ConnectionState.waiting) {
                //         return const CircularProgressIndicator.adaptive();
                //       }
                //       if (snapshot.hasError) {
                //         return const Text("Has error");
                //       }
                //       return ListView.separated(
                //           separatorBuilder: (context, index) => const Padding(
                //               padding: EdgeInsets.symmetric(
                //                   vertical: 5, horizontal: 0)),
                //           itemCount: snapshot.data?.docs.length ?? 1,
                //           shrinkWrap: true,
                //           physics: const NeverScrollableScrollPhysics(),
                //           itemBuilder: (context, index) {
                //             if (currentUser.toString() !=
                //                 snapshot.data?.docs[index].id) {
                //               return MessageCard(
                //                 document: snapshot.data!.docs[index],
                //                 name: snapshot.data?.docs[index].id ?? "empty",
                //                 messageText: "hi",
                //                 imageUrl: "",
                //                 time: "",
                //                 isRead:
                //                     (index == 0 || index == 3) ? true : false,
                //               );
                //             } else {
                //               return const SizedBox.shrink();
                //             }
                //           });
                //     }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
