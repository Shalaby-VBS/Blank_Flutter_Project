import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../routing/app_router.dart';

class AppLocalizations {
  static const Locale arabic = Locale('ar', 'EG');
  static const Locale english = Locale('en', 'US');

  static const List<Locale> supportedLocales = [
    arabic,
    english,
  ];

  static const String translationsPath = 'assets/translations';

  static bool get isEnglish => AppRouter.currentContext!.locale == english;

  static toggleLocale() async {
    await AppRouter.currentContext!.setLocale(isEnglish ? arabic : english);
    recallData();
  }

  static recallData() {
    // Add your code here.
  }

  static resetData() {
    // Add your code here.
  }
}
