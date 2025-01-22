import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/theming/colors.dart';
import 'package:medicalassiss/features/user_features/docots_details/widgets/star_rating.dart';

// ignore: must_be_immutable
class CardDetails extends StatelessWidget {
  String title;
  String subTitle;
  String location;
  String distance;
  double rating;
  int reviews;
  int perNight;
  CardDetails({
    super.key,
    required this.title,
    required this.subTitle,
    required this.location,
    required this.distance,
    required this.rating,
    required this.reviews,
    required this.perNight,
  });

  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.elliptical(52, 90),
            bottomRight: Radius.elliptical(52, 90)),
        // Border radius
        border: Border.all(
          color: Colors.white, // Border color
          width: 2, // Border width
        ),
      ),
      // color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 0, top: 8, bottom: 8).r,
              child: Column(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                        fontSize: 12.sp,
                        // ignore: deprecated_member_use
                        color: Colors.grey.withOpacity(0.8)),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 12,
                        color: ColorManager.buttons,
                      ),
                      Text(
                        'location km to city',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.grey.withOpacity(0.8)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Column(
                      children: <Widget>[
                        StarRating(
                          rating: rating,
                        ),
                        Text(
                          ' $reviews Reviews',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey.withOpacity(0.8)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: isRtl
                ? const EdgeInsets.only(left: 25, top: 8).r
                : const EdgeInsets.only(right: 25, top: 8).r,
            child: Column(
              children: <Widget>[
                Text(
                  '\$$perNight',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  'per hour',
                  style: TextStyle(
                      // ignore: deprecated_member_use
                      fontSize: 14,
                      color: Colors.grey.withOpacity(0.8)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
