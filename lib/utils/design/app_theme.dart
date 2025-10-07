import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

ThemeData lightTheme() => ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    brightness: Brightness.light,
    error: Colors.red,
    onError: Colors.white,
    onPrimary: AppColors.white,
    onSecondary: AppColors.white,
    surface: AppColors.white,
    onSurface: AppColors.primary,
  ),
  textTheme: const TextTheme(
    bodyLarge: AppTextStyles.mulishRegular17,
    bodyMedium: AppTextStyles.mulishRegular14,
    bodySmall: AppTextStyles.mulishRegular10,
    titleLarge: AppTextStyles.mulishBold16,
    titleMedium: AppTextStyles.mulishSemiBold16,
    titleSmall: AppTextStyles.mulishBold12,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: AppColors.white,
      backgroundColor: AppColors.primary,
    ),
  ),
);
