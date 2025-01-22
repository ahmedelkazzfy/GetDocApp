import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/theming/colors.dart';

class TextStyles {
  static TextStyle font24BlackBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: ColorManager.mainColor,
  );

  static TextStyle headline = TextStyle(
      fontSize: 18.sp,
      color: ColorManager.whiteText,
      fontWeight: FontWeight.bold,
      fontFamily: 'cairo');

  static TextStyle mainheadline = TextStyle(
      fontSize: 16.sp,
      color: ColorManager.whiteText,
      fontWeight: FontWeight.bold,
      fontFamily: 'cairo');

  static TextStyle headline1 = TextStyle(
      fontSize: 13.sp,
      color: ColorManager.darkblue,
      fontWeight: FontWeight.bold,
      fontFamily: 'cairo');

  static TextStyle font11darkblueBold = TextStyle(
      fontSize: 11.sp,
      color: ColorManager.darkblue,
      fontWeight: FontWeight.bold,
      fontFamily: 'cairo');
  static TextStyle headline3 = TextStyle(
    fontSize: 11.sp,
    color: ColorManager.grayText,
    fontWeight: FontWeight.bold,
  );
  static TextStyle hintStyle = TextStyle(
    fontSize: 10.sp,
    color: Colors.grey,
    fontWeight: FontWeight.bold,
  );
  static TextStyle secondhintStyle = TextStyle(
      fontSize: 10.sp,
      color: const Color.fromARGB(255, 175, 175, 175),
      fontWeight: FontWeight.w500,
      fontFamily: 'cairo');

  static TextStyle appBarTextStyle = TextStyle(
      fontSize: 20.sp,
      color: ColorManager.darkblue,
      fontWeight: FontWeight.bold,
      fontFamily: 'cairo');
}
