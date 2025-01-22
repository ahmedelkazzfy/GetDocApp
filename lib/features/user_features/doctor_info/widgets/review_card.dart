import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/theming/styles.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final int rating;
  final String comment;

  const ReviewCard(
      {super.key,
      required this.name,
      required this.rating,
      required this.comment});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:
          const EdgeInsets.only(left: 20, bottom: 20).r, // Space between cards
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 252, 249, 249),
          borderRadius: BorderRadius.circular(12.r),
        ),
        // color: Colors.white,
        padding: const EdgeInsets.all(10),
        width: 200.w, // Width of each card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyles.font11darkblueBold,
            ),
            SizedBox(height: 5.h),
            Row(
              children: List.generate(
                  rating,
                  (index) =>
                      const Icon(Icons.star, color: Colors.amber, size: 20)),
            ),
            const SizedBox(height: 5),
            Text(
              comment,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
