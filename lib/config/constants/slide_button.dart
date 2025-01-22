import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slide_to_act/slide_to_act.dart';

// ignore: must_be_immutable
class SlideButton extends StatelessWidget {
  String text;
  Color baseColor;
  IconData icon;
  Color color;
  Function onSlideFunction;

  SlideButton(
      {super.key,
      required this.text,
      required this.baseColor,
      required this.icon,
      required this.color,
      required this.onSlideFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 20).r,
      child: SlideAction(
        borderRadius: 40,
        elevation: 5,
        innerColor: Colors.white,
        outerColor: baseColor,
        sliderButtonIcon: Icon(
          icon,
          color: baseColor,
        ),
        text: text,
        submittedIcon: const Icon(
          Icons.done_outline,
          color: Colors.white,
        ),
        sliderRotate: true,
        textStyle: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'cairo'),
        onSubmit: () {
          onSlideFunction();
          return null;
        },
      ),
    );
  }
}
