import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> items = [
      {"image": "assets/images/doctors/doctor1.jpg", "text": "Dr. John Doe"},
      {"image": "assets/images/doctors/doctor2.jpg", "text": "Dr. Jane Smith"},
      {"image": "assets/images/doctors/doctor3.jpg", "text": "Dr. Emily Brown"},
      {"image": "assets/images/doctors/doctor4.jpg", "text": "Dr. Michael Lee"},
      {
        "image": "assets/images/doctors/doctor5.jpg",
        "text": "Dr. Sarah Johnson"
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 0.4,
              initialPage: 0,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
            items: items.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          // Background Image
                          Image.asset(
                            item["image"]!,
                            fit: BoxFit.cover,
                          ),
                          // Foreground Gradient
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    const Color.fromARGB(255, 31, 168, 196)
                                        .withOpacity(0.6),
                                    Colors.white.withOpacity(0.0),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  stops: const [0.14, 0.4],
                                ),
                              ),
                            ),
                          ),
                          // Text Overlay
                          Positioned(
                            bottom: 10,
                            left: 10,
                            right: 10,
                            child: Text(
                              item["text"]!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 4.0,
                                    color: Colors.black.withOpacity(0.8),
                                    offset: const Offset(2, 2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
