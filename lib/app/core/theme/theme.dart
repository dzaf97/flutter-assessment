import 'package:flutter/material.dart';

class AppColor {
  static Color primary = const Color(0xFF32BAA5);
  static Color secondary = const Color(0xFFEBF8F6);
  static Color background = const Color(0xFFFFFFFF);
}

MaterialColor _appSwatch = MaterialColor(AppColor.primary.value, {
  50: AppColor.primary.withOpacity(.1),
  100: AppColor.primary.withOpacity(.2),
  200: AppColor.primary.withOpacity(.3),
  300: AppColor.primary.withOpacity(.4),
  400: AppColor.primary.withOpacity(.5),
  500: AppColor.primary.withOpacity(.6),
  600: AppColor.primary.withOpacity(.7),
  700: AppColor.primary.withOpacity(.8),
  800: AppColor.primary.withOpacity(.9),
  900: AppColor.primary.withOpacity(1),
});

ThemeData primaryTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: _appSwatch),
  scaffoldBackgroundColor: AppColor.background,
  primarySwatch: _appSwatch,
  bottomAppBarColor: _appSwatch,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.primary,
    foregroundColor: Colors.white,
  ),
);
