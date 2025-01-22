import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/theming/colors.dart';
import 'package:medicalassiss/core/theming/styles.dart';

// ignore: must_be_immutable
class DoctorDetailAppointment extends StatelessWidget {
  String text1;
  String subtext1;
  String text2;
  String subtext2;
  DoctorDetailAppointment(
      {super.key,
      required this.text1,
      required this.subtext1,
      required this.text2,
      required this.subtext2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20).r,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(10), // Rounded corners for the container
        // color: Colors.blue[50],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 8, // Blur radius
            offset: const Offset(0, 4), // Shadow offset
          ),
        ],
      ),
      child: Card(
        // color: const Color.fromARGB(255, 255, 248, 248),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10).r, // Card corners match the container
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Appointment Details",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: ColorManager.buttons,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'cairo',
                ),
              ),
            ),
            //divider
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.h),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorManager.customBorder,
                ),
              ),
            ),
            //date & Time
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 5).r,
              child: Text(
                text1,
                style: TextStyles.hintStyle,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 2).r,
              child: Text(
                subtext1,
                style: TextStyle(
                    fontSize: 10.sp,
                    color: ColorManager.darkblue,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'cairo'),
              ),
            ),

            //Location
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 5).r,
              child: Text(
                text2,
                style: TextStyles.hintStyle,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 2).r,
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      subtext2,
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: ColorManager.darkblue,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'cairo'),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Status: Confirmed",
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
