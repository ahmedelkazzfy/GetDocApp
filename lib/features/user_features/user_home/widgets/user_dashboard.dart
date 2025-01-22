import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/helpers/date_helper.dart';
import 'package:medicalassiss/core/theming/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateHelper.currentDate;
    String dayName = DateHelper.getDayName(currentDate.weekday);
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0.h),
      child: Row(
        children: [
          // Add space between profile picture and text
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // profile picture on the left
                CircleAvatar(
                  radius: 30.r,
                  backgroundImage: const AssetImage(
                    "assets/images/home/user_5.png",
                  ),
                ),
                SizedBox(height: 10.w),
                // Header Section with name
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.hi,
                        style: TextStyles.headline1),
                    Text(
                      "Ahmed Elkazafy",
                      style: TextStyles.font11darkblueBold.copyWith(
                        color: Colors.blueAccent,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "cairo",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // current date
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  dayName,
                  style: TextStyles.headline3,
                ),
                Text(
                  '${currentDate.day}/${currentDate.month}/${currentDate.year}',
                  style: TextStyles.headline1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
