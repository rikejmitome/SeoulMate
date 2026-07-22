import 'package:flutter/material.dart';

abstract final class AppColors {
  static const seoulBlue = Color(0xFF2F80ED);
  static const haechiGold = Color(0xFFFFB547);
  static const koreanCoral = Color(0xFFFF7F6A);
  static const background = Color(0xFFF8F9FA);
  static const surface = Color(0xFFFFFFFF);
  static const surfaceVariant = Color(0xFFF3F5F7);
  static const border = Color(0xFFE5E7EB);
  static const primaryText = Color(0xFF1F2937);
  static const secondaryText = Color(0xFF6B7280);
  static const error = Color(0xFFEB5757);
}

abstract final class AppSpacing {
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 32.0;
  static const xxl = 48.0;
}

abstract final class AppRadius {
  static const small = 8.0;
  static const standard = 16.0;
  static const dialog = 20.0;
}

ThemeData buildAppTheme() {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.seoulBlue,
    brightness: Brightness.light,
    surface: AppColors.surface,
    error: AppColors.error,
  );

  return ThemeData(
    colorScheme: colorScheme,
    scaffoldBackgroundColor: AppColors.background,
    useMaterial3: true,
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        fontSize: AppSpacing.xl,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryText,
      ),
      headlineSmall: TextStyle(
        fontSize: AppSpacing.lg,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryText,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryText,
      ),
      bodyLarge: TextStyle(
        fontSize: AppSpacing.md,
        color: AppColors.primaryText,
      ),
      bodyMedium: TextStyle(fontSize: 14, color: AppColors.secondaryText),
      labelLarge: TextStyle(
        fontSize: AppSpacing.md,
        fontWeight: FontWeight.w600,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.small),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.small),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.small),
        borderSide: const BorderSide(color: AppColors.seoulBlue, width: 2),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.small),
        ),
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.standard),
      ),
    ),
  );
}
