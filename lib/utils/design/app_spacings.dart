import 'package:flutter/material.dart';

@immutable
class AppSpacings extends ThemeExtension<AppSpacings> {
  const AppSpacings({this.small = 8.0, this.medium = 16.0, this.large = 24.0});

  final double small;
  final double medium;
  final double large;

  @override
  AppSpacings copyWith({double? small, double? medium, double? large}) =>
      AppSpacings(
        small: small ?? this.small,
        medium: medium ?? this.medium,
        large: large ?? this.large,
      );
  // Smoothly transition between two Spacings
  @override
  AppSpacings lerp(ThemeExtension<AppSpacings>? other, double t) {
    if (other is! AppSpacings) {
      return this;
    }
    return AppSpacings(
      small: t < 0.5 ? small : other.small,
      medium: t < 0.5 ? medium : other.medium,
      large: t < 0.5 ? large : other.large,
    );
  }
}
