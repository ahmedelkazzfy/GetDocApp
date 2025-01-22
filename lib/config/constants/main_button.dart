import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/theming/styles.dart';

// ignore: must_be_immutable
class MainButton extends StatelessWidget {
  String text;
  Color buttonColor;
  Color iconColor;
  IconData icon;
  Function func;
  MainButton(
      {super.key,
      required this.text,
      required this.iconColor,
      required this.buttonColor,
      required this.icon,
      required this.func});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0.r),
      child: SizedBox(
        width: 150.w,
        child: ElevatedButton.icon(
          onPressed: () {
            func();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            padding: EdgeInsets.symmetric(vertical: 12.h),
          ),
          icon: Icon(
            icon,
            size: 20.sp,
            color: iconColor,
          ),
          label: Text(
            text,
            style: TextStyles.mainheadline,
          ),
        ),
      ),
    );
  }
}
