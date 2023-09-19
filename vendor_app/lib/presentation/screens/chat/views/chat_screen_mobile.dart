import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/app/utils/common_appbar.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/domain/entity/message_model.dart';
import 'package:vendor_app/domain/entity/user_msg.dart';
import 'package:sizer/sizer.dart';

class ChatMobileScreen extends StatefulWidget {
  const ChatMobileScreen({super.key, this.document});
  final DocumentSnapshot? document;

  @override
  State<ChatMobileScreen> createState() => _ChatMobileScreenState();
}

class _ChatMobileScreenState extends State<ChatMobileScreen> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    UserMessageModel data = UserMessageModel.fromMap(
        widget.document?.data() as Map<String, dynamic>);
    final TextEditingController messageController = TextEditingController();
    String textMsg;
    Future sendMessage() async {
      if (messageController.text.trim() != '') {
        textMsg = messageController.text.trimLeft().trimRight();
        messageController.clear();

        ///TODO:
        ///impement the send msg calling.
        _scrollController.animateTo(
          0.0,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300),
        );
      } else {
        messageController.clear();
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: Column(
        children: [
          CommonAppBar(
            backButton: true,
            hideBell: true,
            text: data.userName,
          ),
          const VerticalSpacing(20),
          const Divider(
            height: 1,
            thickness: 2,
            indent: 13,
            endIndent: 5,
          ),
          const VerticalSpacing(10),
          const CommonText(
            text: "Today",
            fontSize: 14,
            color: AppColors.grey,
          ),
          const VerticalSpacing(10),
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(child: messgaeList(data.uid)),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            controller: messageController,
                            textInputAction: TextInputAction.newline,
                            maxLines: 4,
                            minLines: 1,
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: AppColors.primaryText,
                                fontFamily: 'Sora'),
                            decoration: InputDecoration(
                              fillColor: AppColors.whiteGreyish,
                              filled: true,
                              hintText: 'Type a Message...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              hintStyle: TextStyle(
                                  fontSize: 10.sp,
                                  color:
                                      AppColors.secondaryText.withOpacity(0.5),
                                  fontFamily: 'Sora'),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                            ),
                          ),
                        ),
                        const HorizontalSpacing(10),
                        ConstrainedBox(
                          constraints:
                              const BoxConstraints(maxWidth: 50, minHeight: 45),
                          child: TextButton(
                            style: ButtonStyle(
                                backgroundColor: const MaterialStatePropertyAll(
                                    AppColors.primary),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ))),
                            onPressed: () async {
                              await sendMessage();
                            },
                            child: Image.asset(
                              RGIcons.sendIcon,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget messgaeList(otherUserId) {
    return StreamBuilder(
      stream: null,
      // stream: ref
      //     .read(firebaseMsgNotifierProvider.notifier)
      //     .getMessage(otherUserId.toString()),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Has error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: const CircularProgressIndicator());
        } else {
          return ListView.builder(
            shrinkWrap: true,
            reverse: true,
            controller: _scrollController,
            // itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              // final messageData =
              //     snapshot.data!.docs[index].data() as Map<String, dynamic>;
              final message =
                  MessageModel.fromMap(snapshot.data as Map<String, dynamic>);

              return Container(child: buildMessage(message));
            },
          );
        }
      },
    );
  }

  Widget buildMessage(MessageModel message) {
    bool isReciever = (message.senderId ==
        LocalStorageService.instance.user?.userId.toString());
    return Column(
      crossAxisAlignment:
          isReciever ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          // width: 100,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(10),
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(17),
                topRight: const Radius.circular(17),
                bottomLeft: Radius.circular(isReciever ? 17 : 0),
                bottomRight: Radius.circular(isReciever ? 0 : 17)),
            color: (isReciever ? AppColors.primary : AppColors.greyish),
          ),
          child: Column(
            children: [
              CommonText(
                text: message.message,
                fontSize: 12,
                color: (isReciever ? AppColors.white : AppColors.black),
              ),
              // CommonText(
              //   text: message.senderEmail,
              //   fontSize: 8,
              //   color: (isReciever ? AppColors.white : AppColors.black),
              // ),
            ],
          ),
        ),
        const VerticalSpacing(10),
      ],
    );
  }
}
