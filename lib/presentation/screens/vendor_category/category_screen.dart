import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/vendor_category/views/category_mobile.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.pop();
        return true;
      },
      child: const Scaffold(
        backgroundColor: AppColors.secondary,
        body: SafeArea(
          child: Responsive(
              mobile: CategoryMobile(),
              tablet: CategoryMobile(),
              desktop: CategoryMobile()),
        ),
      ),
    );
  }
}
