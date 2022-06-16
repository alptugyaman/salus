import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salus/core/theme/color_theme.dart';

class AppTheme {
  static ThemeData theme() {
    return ThemeData(
      textTheme: GoogleFonts.nunitoSansTextTheme(),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: _appBarTheme(),
      tabBarTheme: _tabBarTheme(),
      navigationBarTheme: _navigationBarTheme(),
    );
  }

  static AppBarTheme _appBarTheme() {
    return const AppBarTheme().copyWith(
      centerTitle: false,
      backgroundColor: AppColors.neutralAlternative,
      elevation: .5,
      actionsIconTheme: const IconThemeData(color: AppColors.neutral600),
      iconTheme: const IconThemeData(color: AppColors.primary900),
      titleTextStyle: GoogleFonts.lora(
        textStyle: const TextStyle(
          color: AppColors.neutral900,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static TabBarTheme _tabBarTheme() {
    return const TabBarTheme().copyWith(
      labelColor: Colors.white,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w700,
        letterSpacing: 0.1,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w700,
        letterSpacing: 0.1,
      ),
      unselectedLabelColor: AppColors.neutral800,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.secondaryMain,
      ),
    );
  }

  static NavigationBarThemeData _navigationBarTheme() {
    return const NavigationBarThemeData().copyWith(
      backgroundColor: Colors.white,
      indicatorColor: AppColors.secondary50,
      labelTextStyle: MaterialStateProperty.all(
        const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: .5,
        ),
      ),
    );
  }
}
