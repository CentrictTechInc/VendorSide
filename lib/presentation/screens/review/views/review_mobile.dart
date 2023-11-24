import 'package:flutter/material.dart';
import 'package:vendor_app/app/extensions/buildcontext_extension.dart';
import 'package:vendor_app/app/utils/common_appbar.dart';
import 'package:vendor_app/app/utils/empty_list.dart';
import 'package:vendor_app/presentation/screens/review/components/review_item.dart';

class ReviewMobile extends StatefulWidget {
  final VoidCallback? onPressed;

  ReviewMobile({super.key, this.onPressed});

  @override
  State<ReviewMobile> createState() => _ReviewMobileState();
}

class _ReviewMobileState extends State<ReviewMobile> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
    });
  }

  List<ReviewChild> reviewList = [
    const ReviewChild(
        name: "someone",
        rating: "4",
        time: "April 01 2023",
        description:
            "Jorem ipsum dolor sit amet, consectetur adipis cing elit. Etiam eu turpis molestie, dictum est a, mattis tellus.",
        serviceName: "Mechanical")
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      constraints: BoxConstraints(maxHeight: context.height),
      child: Column(
        children: [
          CommonAppBar(
            backButton: false,
            onDrawerPressed: widget.onPressed,
            hamburger: true,
            text: "Reviews",
            hideBell: true,
          ),
          Expanded(
              child: reviewList.isEmpty
                  ? const EmptyListWidget(
                      title: 'No Reviews Yet!',
                    )
                  : SingleChildScrollView(
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: reviewList.length,
                          itemBuilder: (context, i) {
                            return ReviewChild(
                                name: reviewList[i].name,
                                time: reviewList[i].time,
                                rating: reviewList[i].rating,
                                description: reviewList[i].description,
                                serviceName: reviewList[i].serviceName);
                          }),
                    )),
        ],
      ),
    );
  }
}
