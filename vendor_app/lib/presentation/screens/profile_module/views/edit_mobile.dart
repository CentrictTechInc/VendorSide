import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/app/utils/common_appbar.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text_button.dart';
import 'package:vendor_app/app/utils/network_image_with_initials.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/data/dto/user_details_dto.dart';
import 'package:vendor_app/presentation/screens/profile_module/components/profile_item.dart';
import 'package:sizer/sizer.dart';

class EditScreenMobile extends StatelessWidget with FieldsValidation {
  EditScreenMobile({super.key});
  final GlobalKey<FormState> editForm = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  bool isSelected = false;
  String base64Image = '';
  void pickFile() async {
    final result = (await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      onFileLoading: (FilePickerStatus status) => print(status),
      allowedExtensions: ['png', 'jpg', 'jpeg', 'heic'],
    ))
        ?.files;
    List<int> imageBytes = result!.first.bytes!;
    base64Image = base64Encode(imageBytes);
    isSelected = true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Form(
          key: editForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonAppBar(
                backButton: true,
                text: "Edit Profile",
                isText: true,
                hideBell: true,
              ),
              const VerticalSpacing(30),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 115,
                      height: 115,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.grey.withOpacity(0.5),
                            width: 0.25,
                          ),
                          borderRadius: BorderRadius.circular(70)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(70),
                        child: const NetWorkImageWithInitials(
                          imageUrl: Drawables.logo,
                          name: "Shaheer",
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 2,
                      right: 0,
                      child: InkWell(
                        child: CircleAvatar(
                          backgroundColor: AppColors.whiteGreyish,
                          radius: 15.sp,
                          child: ImageIcon(
                            const AssetImage(RGIcons.camera),
                            size: 15.sp,
                            color: AppColors.grey,
                          ),
                        ),
                        onTap: () {
                          pickFile();
                          print("object");
                        },
                      ),
                    )
                  ],
                ),
              ),
              const VerticalSpacing(20),
              ProfileItem(
                heading: "UserName",
                icon: RGIcons.profile,
                isTextFields: true,
                validator: emptyFieldValidation,
                hintText: "Berney Johnson",
                controller: nameController,
              ),
              const VerticalSpacing(20),
              ProfileItem(
                heading: "Email",
                icon: RGIcons.email,
                isTextFields: true,
                hintText: "email@email",
                validator: validateEmail,
                controller: emailController,
                readOnly: true,
              ),
              const VerticalSpacing(20),
              ProfileItem(
                heading: "Phone",
                icon: RGIcons.phone,
                isTextFields: true,
                hintText: "(055) 123 456",
                validator: validatePhone,
                controller: phoneController,
              ),
              const VerticalSpacing(20),
              ProfileItem(
                heading: "Location",
                icon: RGIcons.address,
                validator: emptyFieldValidation,
                isTextFields: true,
                hintText:
                    "481 Sandia Loop, Bernalillo, NM 87004, United States",
                controller: addressController,
              ),
              const VerticalSpacing(40),
              Center(
                child: CommonTextButton(
                  onPressed: () {
                    if (editForm.currentState!.validate()) {
                      UserDetailsDto data2 = UserDetailsDto(
                          userId: LocalStorageService.instance.user!.userId!,
                          userName: nameController.text.toString(),
                          email: emailController.text,
                          phone: phoneController.text,
                          address: addressController.text,
                          latitude: 0,
                          longitude: 0);
                    }
                  },
                  text: "SAVE",
                  width: 60,
                  color: AppColors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
