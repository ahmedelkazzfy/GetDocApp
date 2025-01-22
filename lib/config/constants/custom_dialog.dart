import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/config/constants/main_button.dart';
import 'package:medicalassiss/core/helpers/extensions.dart';
import 'package:medicalassiss/core/theming/colors.dart';
import 'package:medicalassiss/core/theming/styles.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final IconData icon;
  final Color backgroundColor;
  final Widget button;
  final bool isAnotherButton;

  const CustomDialog({
    super.key,
    required this.isAnotherButton,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.icon,
    required this.backgroundColor,
    required this.button,
  });

  Widget cardPart(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: Consts.avatarRadius + Consts.padding,
        bottom: Consts.padding,
      ),
      width: MediaQuery.of(context).size.width - 80.w,
      margin: const EdgeInsets.only(top: Consts.avatarRadius),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(Consts.padding),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          Text(title, style: TextStyles.headline1.copyWith(fontSize: 18.sp)),
          const SizedBox(height: 16.0),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyles.headline1.copyWith(),
          ),
          SizedBox(height: 24.0.h),
          button,
          Visibility(
            visible: isAnotherButton,
            child: MainButton(
              text: "No",
              icon: Icons.refresh_outlined,
              iconColor: Colors.white,
              buttonColor: ColorManager.buttons,
              func: () {
                context.pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget circularImage() {
    return Positioned(
      left: Consts.padding,
      right: Consts.padding,
      top: Consts.padding, // Adjust the top as needed
      child: CircleAvatar(
        backgroundColor: backgroundColor, // Background color of the avatar
        radius: Consts.avatarRadius, // Set the radius of the avatar
        child: Icon(
          icon, // Icon of your choice
          color: Colors.white, // Icon color
          size: 40.0, // Size of the icon
        ),
      ),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        //...bottom card part,
        cardPart(context),
        //...top circlular image part,
        circularImage()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 40.0;
}
