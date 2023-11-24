import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/app/app_router.dart';
import 'package:vendor_app/common/resources/colors.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

class RepairGuruVendor extends StatelessWidget {
  const RepairGuruVendor({super.key});

  void setSystemPreferences() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.secondary,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    setSystemPreferences();

    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        title: "Vendor Side",
        scaffoldMessengerKey: scaffoldKey,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
            physics: const ClampingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics())),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData(
          colorScheme: const ColorScheme.light(primary: AppColors.primary),
          buttonTheme:
              const ButtonThemeData(textTheme: ButtonTextTheme.primary),
        ),
      );
    });
  }
}
