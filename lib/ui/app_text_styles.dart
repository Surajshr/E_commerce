import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppTextStyles {
  static TextStyle headlineLarge = GoogleFonts.dmSans(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.6,
    height: 51.2.sp / 32.sp,
  );
  static TextStyle headlineMedium = GoogleFonts.dmSans(
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.4,
    height: 44.8.sp / 28.sp,
  );
  static TextStyle headlineSmall = GoogleFonts.dmSans(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.2,
    height: 38.4.sp / 24.sp,
    color: ColorAssets.onBackground,
  );
  static TextStyle titleLarge = GoogleFonts.dmSans(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.1,
    height: 31.9.sp / 22.sp,
  );
  static TextStyle titleMedium = GoogleFonts.dmSans(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.1,
    height: 29.sp / 20.sp,
  );
  static TextStyle titleSmall = GoogleFonts.dmSans(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.1,
    height: 26.1.sp / 18.sp,
  );
  static TextStyle bodyLarge = GoogleFonts.dmSans(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    height: 24.8.sp / 16.sp,
  );
  static TextStyle bodyMedium = GoogleFonts.dmSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 21.7.sp / 14.sp,
  );

  static TextStyle bodySmall = GoogleFonts.dmSans(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    height: 18.6.sp / 12.sp,
  );
  static TextStyle labelLarge = GoogleFonts.dmSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 18.23.sp / 14.sp,
    color: ColorAssets.onBackground,
  );
  static TextStyle labelMedium = GoogleFonts.dmSans(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    height: 16.sp / 12.sp,
    color: ColorAssets.onBackground,
  );
  static TextStyle labelSmall = GoogleFonts.dmSans(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    height: 13.02.sp / 10.sp,
  );
  static TextStyle capsLarge = GoogleFonts.dmSans(
    fontSize: 12.sp,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w700,
    height: 15.62.sp / 12.sp,
  );
  static TextStyle capsSmall = GoogleFonts.dmSans(
    fontSize: 10.sp,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w700,
    height: 13.02.sp / 10.sp,
  );
}
