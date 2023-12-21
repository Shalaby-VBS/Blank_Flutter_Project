import 'package:blank_project/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'modules/notifications/data/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  NotificationService().initNotification();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp(appRouter: AppRouter()));
}