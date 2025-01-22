import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: must_be_immutable
class StarRating extends StatelessWidget {
  double rating;
  StarRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: rating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 24,
      ratingWidget: RatingWidget(
        full: const Icon(
          Icons.star_rate_rounded,
          color: Colors.amber,
        ),
        half: const Icon(
          Icons.star_half_rounded,
          color: Colors.amber,
        ),
        empty: const Icon(
          Icons.star_border_rounded,
          color: Colors.amber,
        ),
      ),
      itemPadding: EdgeInsets.zero,
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
