import 'package:flutter/material.dart';
import 'package:latexpert/core/constant/strings.dart';
import 'package:latexpert/core/constant/theme_colors.dart' show ThemeColors;
import 'app_text_theme.dart';
import 'breakpoint_enum.dart';

class AppTheme {
  static ThemeData getTheme(BreakpointEnum breakpoint, {bool isDark = false}) {
    final textTheme = AppTextTheme.getTextTheme(breakpoint);
    final colorScheme = isDark
        ? ColorScheme.fromSeed(
      seedColor: ThemeColors.mainGreenColor,
      brightness: Brightness.dark,
    )
        : ColorScheme.fromSeed(seedColor: ThemeColors.mainGreenColor);

    return ThemeData(
      fontFamily: Strings.uberFont,
      textTheme: textTheme,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: isDark ? Colors.grey[900] : ThemeColors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: isDark ? Colors.grey[850] : ThemeColors.white,
        centerTitle: true,
        titleTextStyle: textTheme.titleLarge,
        toolbarHeight: kToolbarHeight,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
      useMaterial3: true,
    );
  }
}