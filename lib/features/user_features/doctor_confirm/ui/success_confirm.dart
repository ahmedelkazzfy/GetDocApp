import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/routing/routes_name.dart';
import 'package:medicalassiss/core/theming/colors.dart';
import 'package:medicalassiss/core/theming/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SuccessConfirm extends StatelessWidget {
  const SuccessConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 3,
          left: 80,
          right: 80,
        ),
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/done.png'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13.0, vertical: 10)
                        .r,
                child: Text(
                  AppLocalizations.of(context)!.appintmentsuccess,
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: ColorManager.darkblue,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'cairo'),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13.0, vertical: 5).r,
                child: Text(
                  AppLocalizations.of(context)!.prepareAttendace,
                  style: TextStyles.hintStyle,
                ),
              ),
              //go to details button
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: Colors.white, // Button background
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: ColorManager.buttons,
                        ) // Rounded corners
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 8),
                        Text(
                          AppLocalizations.of(context)!.goToDetails,
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: ColorManager.buttons,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'cairo',
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RoutesName.home, ((route) => false));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
