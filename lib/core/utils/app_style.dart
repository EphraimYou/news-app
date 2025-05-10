import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/app_colors.dart';

abstract class AppStyle {
  static const String secondeFontFamily = 'Merriweather';

  static TextStyle black600w18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    fontFamily: GoogleFonts.inter().fontFamily,
    color: AppColors.blackColor,
  );
  static TextStyle gray400w12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.inter().fontFamily,
    color: Colors.black,
  );
  static TextStyle titleStyle = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    fontFamily: GoogleFonts.inter().fontFamily,
    color: Colors.black,
  );
}
