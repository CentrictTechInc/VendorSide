import 'package:flutter/material.dart';
import 'package:vendor_app/app/extensions/buildcontext_extension.dart';
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

class ContactUsMobile extends StatefulWidget {
  ContactUsMobile({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  State<ContactUsMobile> createState() => _ContactUsMobileState();
}

class _ContactUsMobileState extends State<ContactUsMobile>
    with FieldsValidation {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController commentsController = TextEditingController();
  final GlobalKey<FormState> contactFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = UserDetailsDto(
        userId: 0,
        userName: "Test",
        email: "email",
        phone: "090",
        address: "USA");
    return Container(
      constraints: BoxConstraints(maxHeight: context.height),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: contactFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonAppBar(
              backButton: false,
              hamburger: true,
              onDrawerPressed: widget.onPressed,
              text: "Contact Us",
              isText: true,
              hideBell: true,
            ),
            const VerticalSpacing(30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
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
                          imageUrl: Drawables.personUrl,
                          name: "Shaheer",
                        ),
                      ),
                    ),
                    const VerticalSpacing(40),
                    ProfileItem(
                        ishighLight: false,
                        heading: "Name",
                        text: user.userName ?? "",
                        icon: RGIcons.profile),
                    const VerticalSpacing(20),
                    ProfileItem(
                        ishighLight: false,
                        heading: "Vendor Shop",
                        text: user.email ?? "",
                        icon: RGIcons.storeIcon),
                    const VerticalSpacing(20),
                    ProfileItem(
                        ishighLight: false,
                        heading: "Email",
                        text: user.email ?? "",
                        icon: RGIcons.email),
                    const VerticalSpacing(20),
                    ProfileItem(
                        ishighLight: false,
                        heading: "Phone",
                        text: user.phone ?? "",
                        icon: RGIcons.phone),
                    const VerticalSpacing(20),
                    ProfileItem(
                      heading: "Comments",
                      icon: RGIcons.commentsIcon,
                      isTextFields: true,
                      validator: emptyFieldValidation,
                      hintText: "Add any comments...",
                      autoValidateMode: AutovalidateMode.disabled,
                      controller: commentsController,
                      maxLines: 4,
                      minLines: 3,
                      readOnly: false,
                    ),
                    VerticalSpacing(context.height * .09),
                    CommonTextButton(
                      onPressed: () {
                        if (contactFormKey.currentState!.validate()) {
                          commentsController.clear();
                        }
                      },
                      text: "SUBMIT",
                      width: 60,
                      color: AppColors.white,
                    ),
                    const VerticalSpacing(20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
