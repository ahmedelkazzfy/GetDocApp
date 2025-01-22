import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/theming/styles.dart';
import 'package:medicalassiss/features/user_features/docots_details/widgets/star_rating.dart';

// ignore: must_be_immutable
class DoctorCardInfo extends StatelessWidget {
  int flex;
  Color backgroundColor;
  String imagePath;
  String titleTxt;
  String subTxt;
  double rating;

  DoctorCardInfo(
      {super.key,
      required this.flex,
      required this.backgroundColor,
      required this.titleTxt,
      required this.subTxt,
      required this.imagePath,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20).r,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(60), // Rounded corners for the container
        color: Colors.blue[50],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 8, // Blur radius
            offset: const Offset(0, 4), // Shadow offset
          ),
        ],
      ),
      child: Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(60).r, // Card corners match the container
        ),
        child: Row(
          children: [
            Expanded(
              flex: flex,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60)
                    .r, // Rounded corners for the image
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover, // Ensures the image fills its container
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0)
                    .r, // Add padding inside the card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleTxt,
                      style: TextStyles.font11darkblueBold,
                    ),
                    Text(
                      subTxt,
                      style: TextStyles.hintStyle,
                    ),
                    StarRating(
                      rating: rating,
                    ),
                    Text(
                      "Altahrir street, Alexandria Corniche, Alexandria, Egypt",
                      style: TextStyles.hintStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
