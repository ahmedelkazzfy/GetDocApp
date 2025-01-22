// import 'package:flutter/material.dart';
// import 'package:mosafer/config/core/colors.dart';

// class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String senderName;
//   const ChatAppBar({super.key, required this.senderName});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       // backgroundColor: primaryColor,
//       automaticallyImplyLeading: false,
//       title: Row(
//         children: [
//           BackButton(),
//           CircleAvatar(
//             backgroundImage: AssetImage("assets/images/user_2.png"),
//           ),
//           SizedBox(width: kDefaultPadding * 0.75),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 senderName,
//                 style: TextStyle(fontSize: 16),
//               ),
//               Text(
//                 "Active 3m ago",
//                 style: TextStyle(fontSize: 12),
//               ),
//             ],
//           )
//         ],
//       ),
//       actions: [
//         IconButton(
//           icon: Icon(Icons.local_phone),
//           onPressed: () {},
//         ),
//         IconButton(
//           icon: Icon(Icons.videocam),
//           onPressed: () {},
//         ),
//         SizedBox(width: kDefaultPadding / 2),
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);
// }
