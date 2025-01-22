import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/theming/styles.dart';

class CheckBox extends StatefulWidget {
  final String option1Title;
  final String option2Title;
  final Function(String) onOptionSelected; // Callback for the selected option

  const CheckBox({
    super.key,
    required this.option1Title,
    required this.option2Title,
    required this.onOptionSelected,
  });

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isOption1Selected = false;
  bool isOption2Selected = false;

  void _onOption1Changed(bool? value) {
    setState(() {
      isOption1Selected = value ?? false;
      if (isOption1Selected) {
        isOption2Selected = false;
        widget.onOptionSelected(widget.option1Title); // Return "Doctor"
      }
    });
  }

  void _onOption2Changed(bool? value) {
    setState(() {
      isOption2Selected = value ?? false;
      if (isOption2Selected) {
        isOption1Selected = false;
        widget.onOptionSelected(widget.option2Title); // Return "User"
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Option 1
                Text(
                  widget.option1Title,
                  style: TextStyles.headline1,
                ),
                SizedBox(width: 10.w),
                Transform.scale(
                  scale: 1.6,
                  child: Checkbox(
                    shape: const CircleBorder(),
                    activeColor: Colors.greenAccent,
                    checkColor: Colors.white,
                    value: isOption1Selected,
                    onChanged: _onOption1Changed,
                  ),
                ),
                SizedBox(width: 20.w),
                // Option 2
                Text(
                  widget.option2Title,
                  style: TextStyles.headline1,
                ),
                SizedBox(width: 10.w),
                Transform.scale(
                  scale: 1.6,
                  child: Checkbox(
                    shape: const CircleBorder(),
                    activeColor: Colors.greenAccent,
                    checkColor: Colors.white,
                    value: isOption2Selected,
                    onChanged: _onOption2Changed,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
