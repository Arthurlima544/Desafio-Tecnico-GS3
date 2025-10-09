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
  static const Color gray = Color(0xFF212121);
  static const Color ligthGray = Color(0xFF363637);
  static const Color ligthergray = Color(0xFF828285);
  static const Color lightWhite = Color(0xFFCDCDD1);
  static const Color surfaceVariant = Color(0xFFE6E6EB);
  static const Color bottomNav = Color(0xFFB4B4B8);
  static final Color outline = const Color(0xFFE5E5E5).withValues(alpha: .7);
  static final Color outlineWith20 = const Color(
    0xFFE5E5E5,
  ).withValues(alpha: .2);
  static const LinearGradient loginBackgroundGradient = LinearGradient(
    colors: <Color>[Color(0xCC2B66BC), Color(0xCC0B1C2B)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient card1Gradient = LinearGradient(
    colors: <Color>[Color(0xFF2B66BC), Color(0xFF132D55)],
  );
  static const LinearGradient card2Gradient = LinearGradient(
    colors: <Color>[Color(0xFF005155), Color(0xFF00292B), Color(0xFF000000)],
  );
  static const LinearGradient homeBackgroundGradient = LinearGradient(
    colors: <Color>[Color(0xFF3C6AB2), Color(0xFFFFFFFF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const Color transparent = Colors.transparent;
  static final Color shadow = Colors.black.withValues(alpha: .1);
  static final Color chipColor = Colors.white.withValues(alpha: .8);
  static const Color titleCarousel = Color(0xFF1A1A1A);
  static final Color iconCarousel = Colors.black.withValues(alpha: .7);
  static final Color skeleton = Colors.black.withValues(alpha: 0.4);
  static final Color lightGrayWith20 = Colors.grey.withValues(alpha: .2);
  static const Color alert = Color(0xFFFFAC31);

  static LinearGradient getLinearGradientForCard(int index) {
    switch (index % 2) {
      case 0:
        return AppColors.card1Gradient;
      case 1:
        return AppColors.card2Gradient;
      default:
        return AppColors.card1Gradient;
    }
  }
}
