import 'package:flutter/material.dart';

export 'app_colors.dart';

class AppSpacing {
  AppSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;

  static const double screenPadding = 20;
}

class AppRadius {
  AppRadius._();

  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;

  static const double input = 12;
  static const double pill = 50;
}

class AppShadows {
  AppShadows._();

  static const List<BoxShadow> small = [
    BoxShadow(
      color: Color(0x11000000),
      blurRadius: 8,
      offset: Offset(0, 2),
    ),
  ];

  static const List<BoxShadow> large = [
    BoxShadow(
      color: Color(0x22000000),
      blurRadius: 20,
      offset: Offset(0, 8),
    ),
  ];
}

class AppTypography {
  AppTypography._();

  static final TextTheme _text = ThemeData.light().textTheme;

  static TextStyle get displayMedium => _text.displayMedium!;
  static TextStyle get headlineLarge => _text.headlineLarge!;
  static TextStyle get headlineMedium => _text.headlineMedium!;
  static TextStyle get titleLarge => _text.titleLarge!;
  static TextStyle get titleMedium => _text.titleMedium!;
  static TextStyle get bodyMedium => _text.bodyMedium!;
  static TextStyle get bodySmall => _text.bodySmall!;
  static TextStyle get labelLarge => _text.labelLarge!;
}