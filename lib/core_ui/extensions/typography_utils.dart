import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'extensions.dart';

extension TypographyUtils on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => GoogleFonts.montserratTextTheme(theme.textTheme);
  ColorScheme get colors => theme.colorScheme;
  TextStyle? get displayLarge => textTheme.displayLarge?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get displayMedium => textTheme.displayMedium?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get displaySmall => textTheme.displaySmall?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get headlineLarge => textTheme.headlineLarge?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get headlineMedium => textTheme.headlineMedium?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get headlineSmall => textTheme.headlineSmall?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get titleLarge => textTheme.titleLarge?.copyWith(
        fontSize: 16.sp,
        color: colors.onSurface,
      );
  TextStyle? get titleMedium => textTheme.titleMedium?.copyWith(
        fontSize: 14.sp,
        color: colors.onSurface,
      );
  TextStyle? get titleSmall => textTheme.titleSmall?.copyWith(
        overflow: TextOverflow.ellipsis,
        color: colors.onSurface,
        fontSize: 12.sp,
      );
  TextStyle? get labelLarge => textTheme.labelLarge?.copyWith(
        overflow: TextOverflow.ellipsis,
        color: colors.onSurface,
        fontSize: 12.sp,
      );
  TextStyle? get labelMedium => textTheme.labelMedium?.copyWith(
        overflow: TextOverflow.ellipsis,
        color: colors.onSurface,
        fontSize: 10.sp,
      );
  TextStyle? get labelSmall => textTheme.labelSmall?.copyWith(
        overflow: TextOverflow.ellipsis,
        color: colors.onSurface,
        fontSize: 8.sp,
      );
  TextStyle? get bodyLarge => textTheme.bodyLarge?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get bodyMedium => textTheme.bodyMedium?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get bodySmall => textTheme.bodySmall?.copyWith(
        color: colors.onSurface,
      );
}
