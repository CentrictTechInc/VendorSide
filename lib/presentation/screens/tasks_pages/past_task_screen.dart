import 'package:flutter/material.dart';
import 'package:vendor_app/app/extensions/buildcontext_extension.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/empty_list.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/domain/entity/tasks_model.dart';
import 'package:vendor_app/presentation/screens/tasks_pages/components/past_tasks_card.dart';

class SortItems extends StatelessWidget {
  const SortItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          RGIcons.account,
        ),
        const SizedBox(
          width: 10,
        ),
        const CommonText(
          text: "Edit",
          fontSize: 14,
          color: AppColors.white,
        ),
      ],
    );
  }
}

class PastTasksScreen extends StatelessWidget {
  PastTasksScreen({
    super.key,
  });
  List<TasksModel> appointmentList = [TasksModel(tasks: 'INP')];
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  List<SortItems> items = <SortItems>[SortItems(), SortItems(), SortItems()];
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: context.height - 500),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: AppColors.whiteGreyish),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: FutureBuilder(
          future: null,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            } else {
              return appointmentList.isNotEmpty
                  ? Column(
                      children: [
                        const VerticalSpacing(15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CommonText(
                              text: "May 2023",
                              fontSize: 16,
                              color: AppColors.black,
                              weight: FontWeight.w600,
                            ),
                            const Spacer(),
                            DropdownButton<SortItems>(
                              hint: CommonText(
                                text: "Sort by  ",
                                fontSize: 12,
                                color: AppColors.black,
                              ),
                              underline: SizedBox(),
                              // underline: ,
                              icon: ImageIcon(AssetImage(RGIcons.sortIcon)),
                              items: items.map((item) {
                                return DropdownMenuItem<SortItems>(
                                  value: item,
                                  child: Text(item
                                      .toString()), // You can customize the child widget as needed
                                );
                              }).toList(),
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                        const VerticalSpacing(15),
                        ListView.separated(
                            separatorBuilder: (context, index) {
                              return const VerticalSpacing(10.0);
                            },
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: appointmentList.length,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 0),
                            itemBuilder: (builder, index) {
                              return PastTasksCard();
                            }),
                      ],
                    )
                  : const Center(
                      child: EmptyListWidget(
                        title: "No Reocrds Found",
                      ),
                    );
            }
          }),
    );
  }
}
