import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/theming/styles.dart';

class MainCard extends StatelessWidget {
  final String title;
  final String buttonText;
  final String description;
  final Function func;

  const MainCard({
    super.key,
    required this.title,
    required this.buttonText,
    required this.description,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.green.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(5, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Stack(
            children: [
              // Background Glow Effect
              Positioned(
                top: -30,
                left: -30,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Colors.blue.withOpacity(0.2),
                        Colors.transparent,
                      ],
                      stops: const [0.4, 1],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -40,
                right: -40,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Colors.green.withOpacity(0.2),
                        Colors.transparent,
                      ],
                      stops: const [0.3, 1],
                    ),
                  ),
                ),
              ),
              // Card Content
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Image Section
                  // Container(
                  //   height: 140.h,
                  //   decoration: BoxDecoration(
                  //     borderRadius:
                  //         BorderRadius.vertical(top: Radius.circular(20.r)),
                  //     image: const DecorationImage(
                  //       image: AssetImage('assets/images/robot.jpg'),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  // Title and Description Section
                  Padding(
                    padding: EdgeInsets.all(16.0.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.health_and_safety,
                              color: Colors.blue.shade700,
                              size: 24.sp,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              title,
                              style: TextStyles.font11darkblueBold.copyWith(
                                fontSize: 20.sp,
                                color: Colors.blue.shade700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          description,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 12.sp,
                            fontFamily: 'cairo',
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Action Button
                  Padding(
                    padding: EdgeInsets.all(16.0.r),
                    child: ElevatedButton.icon(
                      onPressed: () => func(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade600,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      icon: Icon(
                        Icons.chat,
                        size: 20.sp,
                        color: Colors.white,
                      ),
                      label: Text(
                        buttonText,
                        style: TextStyles.mainheadline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
