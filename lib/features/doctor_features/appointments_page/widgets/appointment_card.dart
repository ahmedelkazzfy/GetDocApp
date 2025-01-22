import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/theming/styles.dart';

// ignore: must_be_immutable
class AppointmentCard extends StatelessWidget {
  String patientName;
  String appointmentTime;
  String status;
  VoidCallback onTap;

  AppointmentCard(
      {super.key,
      required this.appointmentTime,
      required this.patientName,
      required this.onTap,
      required this.status});

  @override
  Widget build(BuildContext context) {
    Color statusColor = status == "Confirmed" ? Colors.green : Colors.orange;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.grey[50],
        margin: EdgeInsets.symmetric(vertical: 2.h),
        elevation: 1,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: const AssetImage(
                    "assets/images/home/user_5.png"), // Replace with dynamic image
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patientName,
                      style: TextStyles.headline1,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      appointmentTime,
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    status,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: statusColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.h),
                  Icon(Icons.arrow_forward_ios,
                      size: 16.sp, color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
