import 'package:blank_project/core/widgets/floating_bottom_navigation_bar.dart';
import 'package:blank_project/modules/home/logic/internet_connection/internet_connection_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/enums/enums.dart';
import 'core/routing/app_router.dart';
import 'modules/home/logic/theme/theme_cubit.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
            create: (context) =>
                ThemeCubit()..changeTheme(ThemeModesEnums.initial)),
        BlocProvider<InternetConnectionCubit>(
            create: (context) =>
                InternetConnectionCubit()..checkConnectivity()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          title: 'Localization Cubit',
          debugShowCheckedModeBanner: false,
          navigatorKey: AppRouter.navigatorKey,
          builder: (context, child) {
            return GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child!,
              ),
            );
          },
          home: const FloatingBottomNavigationBar(),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        ),
      ),
    );
  }
}
