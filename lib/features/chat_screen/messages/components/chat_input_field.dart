// import 'package:flutter/material.dart';
// import 'package:mosafer/config/core/colors.dart';

// // ignore: must_be_immutable
// class ChatInputField extends StatelessWidget {
//   final TextEditingController controller;
//   Function onclick;
//   ChatInputField({
//     super.key,
//     required this.controller,
//     required this.onclick,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: kDefaultPadding,
//         vertical: kDefaultPadding / 2,
//       ),
//       decoration: BoxDecoration(
//         color: Theme.of(context).scaffoldBackgroundColor,
//         boxShadow: [
//           BoxShadow(
//             offset: const Offset(0, 4),
//             blurRadius: 32,
//             color: const Color(0xFF087949).withOpacity(0.08),
//           ),
//         ],
//       ),
//       child: SafeArea(
//         child: Row(
//           children: [
//             Icon(Icons.mic, color: appBackgroundColor),
//             const SizedBox(width: kDefaultPadding),
//             Expanded(
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: kDefaultPadding * 0.75,
//                 ),
//                 decoration: BoxDecoration(
//                   color: appBackgroundColor.withOpacity(0.05),
//                   borderRadius: BorderRadius.circular(40),
//                 ),
//                 child: Row(
//                   children: [
//                     const SizedBox(width: kDefaultPadding / 4),
//                     Expanded(
//                       child: TextField(
//                         controller: controller,
//                         decoration: InputDecoration(
//                           hintText: "Type message...",
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                     Icon(
//                       Icons.attach_file,
//                       color: Theme.of(context)
//                           .textTheme
//                           .bodyLarge!
//                           .color!
//                           .withOpacity(0.64),
//                     ),
//                     const SizedBox(width: kDefaultPadding / 4),
//                     Icon(
//                       Icons.camera_alt_outlined,
//                       color: Theme.of(context)
//                           .textTheme
//                           .bodyLarge!
//                           .color!
//                           .withOpacity(0.64),
//                     ),
//                     //send button
//                     IconButton(
//                       icon: Icon(Icons.send_outlined),
//                       onPressed: () {
//                         onclick();
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
