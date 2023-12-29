import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/app/app.dart';
import 'package:vendor_app/app/services/get_all_services.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/app/services/mixpanel_service.dart';
import 'package:vendor_app/firbase_push_notification.dart';
import 'package:vendor_app/firebase_options.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    HttpOverrides.global = MyHttpOverrides();
    LocalStorageService.instance.init();
    Get.put(GetAllServices());
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    await MixpanelManager.initMixpanel();
    await FirebaseApi().initNotifications();

    runApp(const RepairGuruVendor());
  } catch (e) {
    debugPrint(e.toString());
  }
}

// Flutter Certificate Verification
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
