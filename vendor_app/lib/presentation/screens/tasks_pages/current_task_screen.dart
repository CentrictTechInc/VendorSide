import 'package:flutter/material.dart';
import 'package:vendor_app/app/extensions/buildcontext_extension.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/empty_list.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/domain/entity/tasks_model.dart';
import 'package:vendor_app/presentation/screens/tasks_pages/components/tasks_card.dart';

class CurrentTasks extends StatelessWidget {
  CurrentTasks({
    super.key,
  });
  List<TasksModel> appointmentList = [TasksModel(tasks: 'INP')];
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: context.height - 500),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: AppColors.whiteGreyish),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                            ImageIcon(AssetImage(RGIcons.tasksNextIcon)),
                            const HorizontalSpacing(20),
                            CommonText(
                              text: "Scheduled Tasks",
                              fontSize: 16,
                              color: AppColors.black,
                              weight: FontWeight.w600,
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
                              return TasksCard(
                                type: "Completed:",
                                data: appointmentList[index],
                                icon: Icons.alarm,
                                isPending: true,
                              );
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
