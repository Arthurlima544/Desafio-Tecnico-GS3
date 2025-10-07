import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF013972);
  static const Color primaryVariant = Color(0xFF346CBD);
  static const Color secondary = Color(0xFF45A1E7);
  static const Color accentBlue = Color(0xFF2890CF);
  static const Color iconAction = Color(0xFF089EE3);
  static const Color tertiary = Color(0xFF005153);
  static const Color white = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFE6E6EB);
  static const Color outline = Color(0xFFE5E5E5);
  static const LinearGradient loginBackgroundGradient = LinearGradient(
    colors: <Color>[Color(0xFF0B1C2B), Color(0xFF2B66BC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient cardGradient = LinearGradient(
    colors: <Color>[Color(0xFF2B66BC), Color(0xFF132D55)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient homeBackgroundGradient = LinearGradient(
    colors: <Color>[Color(0xFF3C6AB2), Color(0xFFFFFFFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
