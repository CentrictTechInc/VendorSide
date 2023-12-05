import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/app/utils/common_appbar.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text_button.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/automotive_manage_services/controller/auto_manage_services_controller.dart';
import 'package:vendor_app/presentation/screens/manage_services_pages/all_services_screen.dart';
import 'package:vendor_app/presentation/screens/manage_services_pages/my_services_screen.dart';
import 'package:vendor_app/presentation/screens/tasks/components/tab_button.dart';

class ManageAmServicesMobileScreen extends StatelessWidget {
  ManageAmServicesMobileScreen({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      // constraints: BoxConstraints(maxHeight: context.height / 1.6),
      child: GetBuilder<ManageAmServicesController>(
          init: ManageAmServicesController(),
          builder: (controller) {
            return Column(
              children: [
                CommonAppBar(
                  backButton: false,
                  hamburger: true,
                  text: "Manage Services",
                  onDrawerPressed: onPressed,
                  hideBell: true,
                ),
                const VerticalSpacing(10),
                Container(
                    width: context.width,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: AppColors.greyish),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TabButton(
                              name: "My Services",
                              height: 45,
                              fontSize: 20,
                              onPressed: () {
                                controller.changeIndex(0);
                              },
                              highlighted: controller.tabIndex == 0,
                            ),
                          ),
                          Expanded(
                            child: TabButton(
                              name: "All Services",
                              fontSize: 20,
                              height: 45,
                              onPressed: () {
                                controller.changeIndex(1);
                              },
                              highlighted: controller.tabIndex == 1,
                            ),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                  // flex: 10,
                  child: controller.tabIndex == 0
                      ? MyAmServicesScreen()
                      : AllAmServicesScreen(),
                ),
                const VerticalSpacing(15),
                CommonTextButton(
                  onPressed: () async {
                    if (controller.tabIndex == 1) {
                      await controller.postServicePackagePricing();
                    } else if (context.mounted && controller.tabIndex == 0) {}
                    controller.update();
                  },
                  text: "SAVE",
                  width: 30,
                  color: AppColors.white,
                ),
                const VerticalSpacing(20),
              ],
            );
          }),
    );
  }
}
