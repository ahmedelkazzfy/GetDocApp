// import 'package:flutter/material.dart';



// // ignore: must_be_immutable
// class TextMessage extends StatelessWidget {
//   TextMessage({
//     super.key,
//     this.message,
//   });


//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // color: MediaQuery.of(context).platformBrightness == Brightness.dark
//       //     ? Colors.white
//       //     : Colors.black,
//       padding: const EdgeInsets.symmetric(
//         horizontal: kDefaultPadding * 0.75,
//         vertical: kDefaultPadding / 2,
//       ),
//       decoration: BoxDecoration(
//         color: appBackgroundColor.withOpacity(message!.isSender ? 1 : 0.1),
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: Text(
//         message!.text,
//         style: TextStyle(
//           color: message!.isSender
//               ? Colors.white
//               : Theme.of(context).textTheme.bodyLarge!.color,
//         ),
//       ),
//     );
//   }
// }
