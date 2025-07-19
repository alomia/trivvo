import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Colors
const primary = Color(0xFF0BAB7C);
const darkBackground = Color(0xFF14171F);

final lightColorScheme = ColorScheme.fromSeed(seedColor: Colors.green);

final darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: primary,
  onPrimary: Colors.white,
  secondary: primary,
  onSecondary: Colors.white,
  error: Colors.red,
  onError: Colors.red,
  surface: darkBackground,
  onSurface: Colors.white,
);

final lightTheme = ThemeData.from(colorScheme: lightColorScheme);
final darkTheme = ThemeData.from(colorScheme: darkColorScheme).copyWith(
  splashFactory: NoSplash.splashFactory,
  scaffoldBackgroundColor: darkColorScheme.surface,
  highlightColor: Colors.transparent,
  cardTheme: CardThemeData(elevation: 0.0),
  extensions: [
    SkeletonizerConfigData.dark(
      effect: ShimmerEffect(
        baseColor: Color(0xFF1E222B),
        highlightColor: Color(0xFF2A2E38),
      ),
    ),
  ],
);
