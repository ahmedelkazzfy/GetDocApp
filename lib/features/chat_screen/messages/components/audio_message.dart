// import 'package:mosafer/config/core/colors.dart';
// import 'package:mosafer/screens/chat_screen/models/chat_message.dart';
// import 'package:flutter/material.dart';

// class AudioMessage extends StatelessWidget {
//   final ChatMessage? message;

//   const AudioMessage({super.key, this.message});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.55,
//       padding: const EdgeInsets.symmetric(
//         horizontal: kDefaultPadding * 0.75,
//         vertical: kDefaultPadding / 2.5,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         color: bottomNavigationColor.withOpacity(message!.isSender ? 1 : 0.1),
//       ),
//       child: Row(
//         children: [
//           Icon(
//             Icons.play_arrow,
//             color: message!.isSender ? Colors.white : bottomNavigationColor,
//           ),
//           Expanded(
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
//               child: Stack(
//                 clipBehavior: Clip.none,
//                 alignment: Alignment.center,
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 2,
//                     color: message!.isSender
//                         ? Colors.white
//                         : bottomNavigationColor.withOpacity(0.4),
//                   ),
//                   Positioned(
//                     left: 0,
//                     child: Container(
//                       height: 8,
//                       width: 8,
//                       decoration: BoxDecoration(
//                         color: message!.isSender
//                             ? Colors.white
//                             : bottomNavigationColor,
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Text(
//             "0.37",
//             style: TextStyle(
//                 fontSize: 12, color: message!.isSender ? Colors.white : null),
//           ),
//         ],
//       ),
//     );
//   }
// }
