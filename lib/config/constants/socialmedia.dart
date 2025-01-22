// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:medicalassiss/features/user_features/user_home/widgets/option_icon.dart';

// class SocialMediaIcons extends StatelessWidget {
//   const SocialMediaIcons({super.key});

//   Widget circleIcon(String imagepath) {
//     return Container(
//       height: 60.h,
//       width: 60.w,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 20.0.r,
//           )
//         ],
//         borderRadius: BorderRadius.all(
//           const Radius.circular(200.0).r,
//         ),
//       ),
//       child: Container(
//         alignment: Alignment.center,
//         child: Image.asset(
//           imagepath,
//           width: 50.w,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Stack(children: <Widget>[
//       Positioned(
//         top: size.height - 100,
//         right: 80.w,
//         child: OptionIcon(
//           title: "",
//           imagePath: "assets/images/facebook-svgrepo-.svg",
//           onclick: () {
//             debugPrint("Ahmed");
//             // Navigator.pushNamed(context, RoutesName.doctorsDetails);
//           },
//         ),
//       ),
//       Positioned(
//         top: size.height - 150,
//         right: 20.w,
//         child: OptionIcon(
//           title: "",
//           imagePath: "assets/images/gmail-svgrepo-com.svg",
//           onclick: () {
//             debugPrint("Ahmed");
//             // Navigator.pushNamed(context, RoutesName.doctorsDetails);
//           },
//         ),
//       ),
//     ]);
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/features/user_features/user_home/widgets/option_icon.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({super.key});

  // Widget circleIcon(String imagepath) {
  //   return Container(
  //     height: 100.h,
  //     width: 100.w,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black26,
  //           blurRadius: 25.0.r,
  //         )
  //       ],
  //       borderRadius: BorderRadius.all(
  //         const Radius.circular(100.0).r,
  //       ),
  //     ),
  //     child: Container(
  //       alignment: Alignment.center,
  //       child: Image.asset(
  //         imagepath,
  //         width: 20.w,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      OptionIcon(
        title: "",
        imagePath: "assets/images/facebook-svgrepo-.svg",
        onclick: () {
          debugPrint("Ahmed");
          // Navigator.pushNamed(context, RoutesName.doctorsDetails);
        },
      ),
      SizedBox(
        width: 10.h,
      ),
      OptionIcon(
        title: "",
        imagePath: "assets/images/gmail-svgrepo-com.svg",
        onclick: () {
          debugPrint("Ahmed");
          // Navigator.pushNamed(context, RoutesName.doctorsDetails);
        },
      ),
    ]);
  }
}
