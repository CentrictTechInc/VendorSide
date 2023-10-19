import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vendor_app/app/app.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorageService.instance.init();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  HttpOverrides.global = MyHttpOverrides();
  // await FirebaseApi().initNotifications();

  runApp(const RepairGuruVendor());
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
