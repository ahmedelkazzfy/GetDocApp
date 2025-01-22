import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:medicalassiss/core/theming/styles.dart';

// ignore: must_be_immutable
class OptionIcon extends StatelessWidget {
  String title;
  String imagePath;
  Function onclick;
  OptionIcon(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.onclick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            onclick();
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(171, 255, 247, 247),
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0).r,
              child: Image(
                width: 50.w,
                height: 50.w,
                image: Svg(imagePath),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          title,
          style: TextStyles.font11darkblueBold,
        ),
      ],
    );
  }
}
