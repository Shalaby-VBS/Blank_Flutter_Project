import 'package:blank_project/core/localizations/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../constants/app_assets.dart';

class LocalizationButton extends StatefulWidget {
  const LocalizationButton({super.key});

  @override
  State<LocalizationButton> createState() => _LocalizationButtonState();
}

class _LocalizationButtonState extends State<LocalizationButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await AppLocalizations.toggleLocale();
        setState(() {});
        //
        // if (context.locale == AppLocalizations.arabic) {
        //   SharedPreferencesHelper.setData(SharedPreferencesKeys.language, 'ar');
        // }
        // if (context.locale == AppLocalizations.english) {
        //   SharedPreferencesHelper.setData(SharedPreferencesKeys.language, 'en');
        // }
      },
      icon: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.r),
          color: Colors.grey,
        ),
        child: Lottie.asset(AppLotties.localization),
      ),
    );
  }
}
