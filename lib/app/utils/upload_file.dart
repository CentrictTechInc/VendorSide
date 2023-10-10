import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/app/extensions/buildcontext_extension.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';

class UploadButtonWithFile extends StatelessWidget {
  UploadButtonWithFile(
      {super.key,
      this.platformfile,
      this.imageLink = '',
      required this.label,
      required this.topLabel,
      this.width = 170,
      this.onDeletePress,
      this.onPress});
  final String imageLink;
  final String topLabel;
  final String label;
  final double width;
  Function()? onDeletePress;
  Function()? onPress;
  PlatformFile? platformfile;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      CommonText(
        text: topLabel,
        color: AppColors.primaryText,
        fontSize: 15,
        weight: FontWeight.w700,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 10,
      ),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
              height: 100,
              width: context.width,
              decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(10)),
              child: imageLink.isEmpty && platformfile == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          GestureDetector(
                            onTap: onPress,
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Container(
                                height: 80,
                                width: 100,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  children: [
                                    const ImageIcon(
                                      AssetImage(RGIcons.upload),
                                      color: AppColors.black,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CommonText(
                                      text: label,
                                      color: AppColors.black,
                                      fontSize: 14,
                                      weight: FontWeight.w400,
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ])
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                  height: 80,
                                  // width: ,
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0xFFCFD7FF)
                                                .withOpacity(0.2),
                                            offset: const Offset(0, 2),
                                            blurRadius: 5,
                                            spreadRadius: 3),
                                      ],
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: imageLink.isNotEmpty
                                      ? Image.network(
                                          imageLink,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.memory(
                                          platformfile!.bytes!,
                                          fit: BoxFit.contain,
                                        )),
                              Positioned(
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: onDeletePress,
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        padding: const EdgeInsets.all(5),
                                        // child: ImageIcon(
                                        //   AssetImage(RGIcons.delete),
                                        //   color: AppColors.red,
                                        // ),
                                        decoration: BoxDecoration(
                                            // color: Colors.red,
                                            // image: DecorationImage(
                                            //     image:
                                            //         AssetImage(RGIcons.delete)),
                                            color: AppColors.red,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          imageLink.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 5),
                                  child: CommonText(
                                    textAlign: TextAlign.center,
                                    fontSize: 12,
                                    weight: FontWeight.bold,
                                    textOverflow: TextOverflow.ellipsis,
                                    text: imageLink,
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    )))
    ]);
  }
}
