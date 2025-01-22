import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/config/constants/core.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class PasswordBasicButton extends StatelessWidget {
  final String hintTextField;
  final IconData iconName;
  final TextEditingController textEController;
  Function onChangeFunc;
  final List<String?> errors = [];

  PasswordBasicButton({
    super.key,
    required this.hintTextField,
    required this.iconName,
    required this.textEController,
    required this.onChangeFunc,
  });

  FocusNode node = FocusNode();
  bool _passwordVisible = false;
  Color textfieldBorderFocusColor = Colors.black;
  Color textfieldBorderColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return TextFormField(
          controller: textEController,
          // focusNode: node,
          style: TextStyle(
              fontSize: 15.0.sp,
              fontFamily: "cairo",
              color: Colors.black,
              fontWeight: FontWeight.w500),

          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 16.0.h),
            border: InputBorder.none, // Remove underline
            suffixIcon: IconButton(
              icon: Container(
                margin: EdgeInsets.symmetric(horizontal: 40.w),
                child: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: maincolor,
                  // color: Theme.of(context).primaryColorDark,
                ),
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
            prefixIcon: Icon(
              iconName,
              color: Colors.grey,
            ),
            hintText: hintTextField,
            hintStyle: const TextStyle(fontSize: 13.0, color: Colors.grey),
          ),
          obscureText: !_passwordVisible,
          onChanged: (value) {},

          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppLocalizations.of(context)!.enterYourPassword;
            }
            if (value.length < 8) {
              return AppLocalizations.of(context)!.shortPassword;
            }

            return null;
          },
        );
      },
    );
  }
}
