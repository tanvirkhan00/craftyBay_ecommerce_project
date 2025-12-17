import 'package:ecommerce_project/App/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme{
    return ThemeData(
      brightness: Brightness.light,
      colorSchemeSeed: AppColors.themeColor
    );
  }

  static ThemeData get darkTheme{
    return ThemeData(
      brightness: Brightness.dark,
      colorSchemeSeed: AppColors.themeColor,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.themeColor
      )
    );
  }
}