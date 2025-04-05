import 'package:flutter/material.dart';

import 'colors.dart';

class BaseTheme {
  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        // primaryColor: AppColors.primaryColor,
        appBarTheme: const AppBarTheme(
          surfaceTintColor: AppColors.white,
          backgroundColor: AppColors.white,
        ),
        scaffoldBackgroundColor: AppColors.white,
      );
  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        // primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.black,
      );
}
