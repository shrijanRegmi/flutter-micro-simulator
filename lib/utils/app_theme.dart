import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:micro_simulator/utils/app_colors.dart';

class AppTheme {
  static var _brightness = Brightness.light;
  static ThemeData get lightPalette {
    _brightness = Brightness.light;
    return ThemeData(
      brightness: _brightness,
      scaffoldBackgroundColor: AppColors.colorScaffoldBg,
      fontFamily: GoogleFonts.montserrat().fontFamily,
    );
  }

  static ThemeData get darkPalette {
    _brightness = Brightness.dark;
    return ThemeData(
      brightness: _brightness,
      scaffoldBackgroundColor: AppColors.colorScaffoldBgDark,
      fontFamily: GoogleFonts.montserrat().fontFamily,
    );
  }
}
