import 'package:blank_project/core/helpers/bloc_observer_checker.dart';
import 'package:blank_project/my_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

import 'core/di/dependency_injection.dart';
import 'core/localizations/app_localizations.dart';
import 'core/routing/app_router.dart';
import 'modules/notifications/data/notification_service.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
NotificationService notificationService = NotificationService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();
  setupGetIt();
  notificationService.initNotification();
  await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  Bloc.observer = const BlocObserverChecker();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });

  runApp(
    EasyLocalization(
      supportedLocales: AppLocalizations.supportedLocales,
      path: AppLocalizations.translationsPath,
      saveLocale: true,
      fallbackLocale: AppLocalizations.english,
      startLocale: AppLocalizations.english,
      child: MyApp(appRouter: AppRouter()),
    ),
  );
}
