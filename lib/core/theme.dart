import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_workout/core/constants.dart';

/// Defines the color palettes and typography for the OpenWorkout app.
class AppTheme {
  // --- New Brand Colors ---
  static const Color primaryYellow = Color(
    0xFFF7F505,
  ); // Your specified primary color
  static const Color hintColor = Color(
    0xFF8BC34A,
  ); // A complementary green accent
  static const Color darkPrimaryYellow = Color(
    0xFFDEDC00,
  ); // Slightly darker for dark theme primary

  // --- Shared Colors ---
  static const Color lightBackground = Color(
    0xFFF5F5F5,
  ); // Light grey for background
  static const Color darkBackground = Color(
    0xFF121212,
  ); // Very dark grey for dark mode background
  static const Color darkCardColor = Color(
    0xFF1E1E1E,
  ); // Slightly lighter for cards in dark mode
  static const Color filledColor = Color(0xffF5F5E5);
  static const Color textLight = Colors.black87;
  static const Color textDark = Colors.white;
  static const Color textSecondaryLight = Colors.black54;
  static const Color textSecondaryDark = Colors.white70;

  // --- Light Theme ---
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryYellow,
    hintColor: hintColor, // Accent color

    scaffoldBackgroundColor: lightBackground,

    appBarTheme: AppBarTheme(
      color: primaryYellow,
      foregroundColor: textLight, // Adjust text color to be visible on yellow
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.splineSans(
        // Apply Spline Sans
        color: textLight,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: hintColor,
      foregroundColor: textDark,
    ),

    cardTheme: CardTheme(
      elevation: AppConstants.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      color: Colors.white,
      margin: const EdgeInsets.all(AppConstants.defaultPadding / 2),
    ),

    textTheme: TextTheme(
      headlineLarge: GoogleFonts.splineSans(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: textLight,
      ),
      headlineMedium: GoogleFonts.splineSans(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: textLight,
      ),
      headlineSmall: GoogleFonts.splineSans(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: textLight,
      ),
      bodyLarge: GoogleFonts.splineSans(fontSize: 16.0, color: textLight),
      bodyMedium: GoogleFonts.splineSans(fontSize: 14.0, color: textLight),
      bodySmall: GoogleFonts.splineSans(
        fontSize: 12.0,
        color: textSecondaryLight,
      ),
      labelLarge: GoogleFonts.splineSans(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: textLight,
      ), // For button text
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        borderSide: const BorderSide(color: hintColor, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        borderSide: const BorderSide(color: Colors.red, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        borderSide: const BorderSide(color: Colors.red, width: 2.0),
      ),
      filled: true,
      fillColor: filledColor,
      contentPadding: const EdgeInsets.symmetric(
        vertical: AppConstants.defaultPadding / 1.5,
        horizontal: AppConstants.defaultPadding,
      ),
      labelStyle: GoogleFonts.splineSans(color: textSecondaryLight),
      hintStyle: GoogleFonts.splineSans(color: Colors.grey),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: textLight, // Text color on primary yellow button
        backgroundColor: primaryYellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding * 2,
          vertical: AppConstants.defaultPadding,
        ),
        textStyle: GoogleFonts.splineSans(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: hintColor,
        textStyle: GoogleFonts.splineSans(),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryYellow,
        side: const BorderSide(color: primaryYellow),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding * 2,
          vertical: AppConstants.defaultPadding,
        ),
        textStyle: GoogleFonts.splineSans(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: primaryYellow,
        iconColor: primaryYellow,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
      ),
    ),

    iconTheme: const IconThemeData(color: Colors.black),
    listTileTheme: const ListTileThemeData(iconColor: primaryYellow),
  );

  // --- Dark Theme ---
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor:
        darkPrimaryYellow, // Slightly darker yellow for dark mode primary
    hintColor: hintColor, // Same accent in dark mode

    scaffoldBackgroundColor: darkBackground,

    appBarTheme: AppBarTheme(
      color: darkCardColor,
      foregroundColor: textDark,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.splineSans(
        color: textDark,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: hintColor,
      foregroundColor: textDark,
    ),

    cardTheme: CardTheme(
      elevation: AppConstants.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      color: darkCardColor,
      margin: const EdgeInsets.all(AppConstants.defaultPadding / 2),
    ),

    textTheme: TextTheme(
      headlineLarge: GoogleFonts.splineSans(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: textDark,
      ),
      headlineMedium: GoogleFonts.splineSans(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: textDark,
      ),
      headlineSmall: GoogleFonts.splineSans(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: textDark,
      ),
      bodyLarge: GoogleFonts.splineSans(
        fontSize: 16.0,
        color: textSecondaryDark,
      ),
      bodyMedium: GoogleFonts.splineSans(
        fontSize: 14.0,
        color: textSecondaryDark,
      ),
      bodySmall: GoogleFonts.splineSans(fontSize: 12.0, color: Colors.white60),
      labelLarge: GoogleFonts.splineSans(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: textDark,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        borderSide: BorderSide(color: Colors.grey.shade700, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        borderSide: const BorderSide(color: hintColor, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        borderSide: const BorderSide(color: Colors.red, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        borderSide: const BorderSide(color: Colors.red, width: 2.0),
      ),
      filled: true,
      fillColor: Colors.grey.shade800,
      contentPadding: const EdgeInsets.symmetric(
        vertical: AppConstants.defaultPadding / 1.5,
        horizontal: AppConstants.defaultPadding,
      ),
      labelStyle: GoogleFonts.splineSans(color: textSecondaryDark),
      hintStyle: GoogleFonts.splineSans(color: Colors.grey),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: textDark, // Text color on dark primary button
        backgroundColor: darkPrimaryYellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding * 2,
          vertical: AppConstants.defaultPadding,
        ),
        textStyle: GoogleFonts.splineSans(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: hintColor,
        textStyle: GoogleFonts.splineSans(),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(foregroundColor: Color(0xffF5F5E5)),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: darkPrimaryYellow,
        side: BorderSide(color: darkPrimaryYellow),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding * 2,
          vertical: AppConstants.defaultPadding,
        ),
        textStyle: GoogleFonts.splineSans(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    iconTheme: IconThemeData(color: darkPrimaryYellow),
    listTileTheme: ListTileThemeData(iconColor: darkPrimaryYellow),
  );
}
