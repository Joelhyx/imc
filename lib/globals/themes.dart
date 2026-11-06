import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Plus Jakarta Sans',
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF0D9488),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFCCFBF1),
    onPrimaryContainer: Color(0xFF115E59),
    secondary: Color(0xFF10B981),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD1FAE5),
    onSecondaryContainer: Color(0xFF065F46),
    tertiary: Color(0xFF0284C7),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFE0F2FE),
    onTertiaryContainer: Color(0xFF0369A1),
    surface: Color(0xFFF8FAFC),
    onSurface: Color(0xFF0F172A),
    surfaceContainerLow: Color(0xFFF1F5F9),
    surfaceContainer: Color(0xFFFFFFFF),
    surfaceContainerHigh: Color(0xFFE2E8F0),
    onSurfaceVariant: Color(0xFF64748B),
    outline: Color(0xFFCBD5E1),
    outlineVariant: Color(0xFFE2E8F0),
  ),
  scaffoldBackgroundColor: const Color(0xFFF8FAFC),
  cardTheme: CardThemeData(
    color: const Color(0xFFFFFFFF),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: const BorderSide(color: Color(0xFFE2E8F0), width: 1),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: const Color(0xFF0D9488),
      foregroundColor: const Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      textStyle: const TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: const Color(0xFF0D9488),
      side: const BorderSide(color: Color(0xFF0D9488), width: 1.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFF8FAFC),
    foregroundColor: Color(0xFF0F172A),
    elevation: 0,
    centerTitle: true,
  ),
);

@NowaGenerated()
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Plus Jakarta Sans',
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF14B8A6),
    onPrimary: Color(0xFF042F2E),
    primaryContainer: Color(0xFF115E59),
    onPrimaryContainer: Color(0xFFCCFBF1),
    secondary: Color(0xFF34D399),
    onSecondary: Color(0xFF022C22),
    secondaryContainer: Color(0xFF065F46),
    onSecondaryContainer: Color(0xFFD1FAE5),
    tertiary: Color(0xFF38BDF8),
    onTertiary: Color(0xFF082F49),
    tertiaryContainer: Color(0xFF0369A1),
    onTertiaryContainer: Color(0xFFE0F2FE),
    surface: Color(0xFF0F172A),
    onSurface: Color(0xFFF8FAFC),
    surfaceContainerLow: Color(0xFF1E293B),
    surfaceContainer: Color(0xFF1E293B),
    surfaceContainerHigh: Color(0xFF334155),
    onSurfaceVariant: Color(0xFF94A3B8),
    outline: Color(0xFF475569),
    outlineVariant: Color(0xFF334155),
  ),
  scaffoldBackgroundColor: const Color(0xFF0B1120),
  cardTheme: CardThemeData(
    color: const Color(0xFF1E293B),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: const BorderSide(color: Color(0xFF334155), width: 1),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: const Color(0xFF14B8A6),
      foregroundColor: const Color(0xFF042F2E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      textStyle: const TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: const Color(0xFF14B8A6),
      side: const BorderSide(color: Color(0xFF14B8A6), width: 1.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF0B1120),
    foregroundColor: Color(0xFFF8FAFC),
    elevation: 0,
    centerTitle: true,
  ),
);
