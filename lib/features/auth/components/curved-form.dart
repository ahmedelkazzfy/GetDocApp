// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CurvedForm extends StatelessWidget {
  Widget formdata;
  CurvedForm({super.key, required this.formdata});

  @override
  Widget build(BuildContext context) {
    // Determine the locale direction
    bool isRtl = Directionality.of(context) == TextDirection.rtl;
    return Container(
      padding: EdgeInsets.only(
          left: isRtl ? 0.0.w : 10.0.w, right: isRtl ? 10.0.w : 0.0.w),
      margin: EdgeInsets.only(
          left: isRtl ? 40.0.w : 0.0.w, right: isRtl ? 0.0.w : 40.0.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20.0.r,
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: isRtl ? Radius.circular(90.0.r) : Radius.zero,
          bottomLeft: isRtl ? Radius.circular(90.0.r) : Radius.zero,
          topRight: isRtl ? Radius.zero : Radius.circular(90.0.r),
          bottomRight: isRtl ? Radius.zero : Radius.circular(90.0.r),
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Adjust alignment for RTL/LTR
        children: [
          formdata, // Your form or widget here
        ],
      ),
    );
  }
}
