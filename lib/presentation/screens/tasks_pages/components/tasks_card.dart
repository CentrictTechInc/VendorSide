import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/network_image_with_initials.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/domain/entity/tasks_model.dart';
import 'package:vendor_app/presentation/screens/tasks_pages/task_details_screen.dart';

// ignore: must_be_immutable
class TasksCard extends StatelessWidget {
  TasksCard({
    super.key,
    required this.type,
    required this.task,
    required this.icon,
    this.isPending = false,
    this.isgrey = false,
    this.hasDetails = true,
  });

  dayOfWeek(DateTime date) {
    switch (date.weekday) {
      case 1:
        return "Mon";
      case 2:
        return "Tue";
      case 3:
        return "Wed";
      case 4:
        return "Thur";
      case 5:
        return "Fri";
      case 6:
        return "Sat";
      case 7:
        return "Sun";
      default:
        return "";
    }
  }

  final String type;
  final IconData icon;
  bool isPending;
  TasksStatusResponseModel task;
  bool isgrey;
  bool hasDetails;

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(task.appointmentDate ?? '2022-01-01');
    return InkWell(
      onTap: hasDetails
          ? () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TaskDetailScreen(
                            tasks: task,
                          )));
            }
          : () {},
      splashColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        decoration: BoxDecoration(
          color: isgrey ? AppColors.whiteGreyish : AppColors.white,
          boxShadow: [
            BoxShadow(color: AppColors.grey.withOpacity(0.2), blurRadius: 2.0),
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (task.status == "Current")
                    Container(
                      width: 97,
                      height: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.primary),
                      child: const Center(
                        child: CommonText(
                          text: "Pending",
                          fontSize: 10,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  const VerticalSpacing(10),
                  Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.grey.withOpacity(0.5),
                              width: 0.25,
                            ),
                            borderRadius: BorderRadius.circular(70)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(70),
                          child: NetWorkImageWithInitials(
                            imageUrl: Drawables.personUrl,
                            name: task.username?[0].toString(),
                            backgroundColor: isgrey
                                ? AppColors.white
                                : AppColors.whiteGreyish,
                            textColor: AppColors.black,
                            fontSize: 36,
                          ),
                        ),
                      ),
                      const HorizontalSpacing(10),
                      Expanded(
                        child: CommonText(
                          text: task.username ?? '',
                          fontSize: 12.sp,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpacing(10),
                  Row(
                    children: [
                      const ImageIcon(
                        AssetImage(RGIcons.serviceBuild),
                        size: 22,
                      ),
                      const HorizontalSpacing(8),
                      Expanded(
                        child: CommonText(
                          text: task.serviceName ?? '',
                          fontSize: 12,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  CommonText(
                    text: task.subServiceName ?? '',
                    fontSize: 15,
                    weight: FontWeight.w600,
                  ),
                  const VerticalSpacing(15),
                  Row(
                    children: [
                      const ImageIcon(
                        AssetImage(RGIcons.location1),
                        color: AppColors.primary,
                        size: 24,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: CommonText(
                          text: task.location ?? '',
                          fontSize: 10.sp,
                          letterSpacing: 0.7,
                          color: AppColors.grey,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 48,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.primary),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CommonText(
                            text: " ${dayOfWeek(date)}",
                            fontSize: 12,
                            color: AppColors.white,
                            weight: FontWeight.w500,
                          ),
                          CommonText(
                            text: date.day.toString().padLeft(2, '0'),
                            fontSize: 18,
                            color: AppColors.white,
                            weight: FontWeight.w600,
                          ),
                        ]),
                  ),
                  const VerticalSpacing(10),
                  CommonText(
                    text:
                        "${task.time?.split(" ")[0]}\n    ${task.time?.split(" ")[1]}",
                    fontSize: 16,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
