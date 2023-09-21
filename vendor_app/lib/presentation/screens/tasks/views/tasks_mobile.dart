import 'package:flutter/material.dart';
import 'package:vendor_app/app/extensions/buildcontext_extension.dart';
import 'package:vendor_app/app/utils/common_appbar.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/tasks/components/tab_button.dart';
import 'package:vendor_app/presentation/screens/tasks_pages/current_task_screen.dart';
import 'package:vendor_app/presentation/screens/tasks_pages/past_task_screen.dart';
import 'package:vendor_app/presentation/screens/tasks_pages/request_task_screen.dart';

class TasksMobileScreen extends StatelessWidget {
  TasksMobileScreen({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CommonAppBar(
            backButton: false,
            hamburger: true,
            text: "Tasks",
            onDrawerPressed: onPressed,
            hideBell: true,
          ),
          const VerticalSpacing(10),
          Container(
              width: context.width,
              height: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: AppColors.whiteGreyish),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: tabs.length,
                  itemBuilder: (context, i) {
                    return tabs[i]
                      ..highlighted = currentPage == pageController.initialPage
                      ..onPressed = () {
                        currentPage = 0;
                        print(currentPage);
                        print(pageController.initialPage);
                        print(currentPage == pageController.initialPage);
                      };
                  },
                ),
              )),
          const VerticalSpacing(5),
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (value) {},
              children: [
                RequestsTaskScreen(),
                CurrentTasks(),
                PastTasksScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final List<TabButton> tabs = [
    TabButton(
      name: "Requests",
      onPressed: () {},
    ),
    TabButton(
      name: "Current",
      onPressed: () {},
    ),
    TabButton(
      name: "Past",
      onPressed: () {},
    ),
  ];
  final PageController pageController = PageController(
    initialPage: 0,
  );
  int currentPage = 1;
}
