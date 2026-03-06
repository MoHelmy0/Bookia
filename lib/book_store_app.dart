import 'package:booksotre/core/routes/app_router.dart';
import 'package:booksotre/core/routes/routes.dart';
import 'package:booksotre/features/auth/ui/login_screen.dart';
import 'package:booksotre/features/auth/ui/register_screen.dart';
import 'package:booksotre/features/welcome/ui/welcome_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookStoreApp extends StatelessWidget {
  const BookStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(

        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          fontFamily: "DM"
        ),
        onGenerateRoute:AppRouter().onGenerateRoute ,
        home: WelcomeScreen(),
      ),
    );
  }
}
