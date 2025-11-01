import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Colors
const primary = Color(0xFF0BAB7C);
const darkBackground = Color(0xFF14171F);

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.green,
  surface: Colors.white,
);

final darkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: primary,
  primary: primary,
  secondary: primary,
  surface: darkBackground,
  surfaceContainerHigh: Color(0xFF111924),
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
