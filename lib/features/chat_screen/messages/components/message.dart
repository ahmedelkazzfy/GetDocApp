// import 'package:mosafer/config/core/colors.dart';
// import 'package:mosafer/screens/chat_screen/models/chat_message.dart';
// import 'package:mosafer/screens/chat_screen/models/chat_message.dart'
//     as mosafer;

// import 'package:flutter/material.dart';

// import 'audio_message.dart';
// import 'text_message.dart';
// import 'video_message.dart';

// // ignore: must_be_immutable
// class Message extends StatelessWidget {
//   Message({
//     super.key,
//     required this.message,
//   });

//   // Use the ChatMessage class from the mosafer package
//   mosafer.ChatMessage message;

//   @override
//   Widget build(BuildContext context) {
//     Widget messageContaint(mosafer.ChatMessage message) {
//       switch (message.messageType) {
//         case ChatMessageType.text:
//           return TextMessage(message: message);
//         case ChatMessageType.audio:
//           return AudioMessage(message: message);
//         case ChatMessageType.video:
//           return const VideoMessage();
//         default:
//           return const SizedBox();
//       }
//     }

//     return Padding(
//       padding: const EdgeInsets.only(top: kDefaultPadding),
//       child: Row(
//         mainAxisAlignment:
//             message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
//         children: [
//           if (!message.isSender) ...[
//             const CircleAvatar(
//               radius: 12,
//               backgroundImage: AssetImage("assets/images/user_2.png"),
//             ),
//             const SizedBox(width: kDefaultPadding / 2),
//           ],
//           messageContaint(message),
//           if (message.isSender) MessageStatusDot(status: message.messageStatus)
//         ],
//       ),
//     );
//   }
// }

// class MessageStatusDot extends StatelessWidget {
//   final mosafer.MessageStatus? status;

//   const MessageStatusDot({super.key, this.status});
//   @override
//   Widget build(BuildContext context) {
//     Color dotColor(mosafer.MessageStatus status) {
//       switch (status) {
//         case mosafer.MessageStatus.notSent:
//           return Colors.red;
//         case mosafer.MessageStatus.notView:
//           return Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.1);
//         case mosafer.MessageStatus.viewed:
//           return bottomNavigationColor;
//         default:
//           return Colors.transparent;
//       }
//     }

//     return Container(
//       margin: const EdgeInsets.only(left: kDefaultPadding / 2),
//       height: 12,
//       width: 12,
//       decoration: BoxDecoration(
//         color: dotColor(status!),
//         shape: BoxShape.circle,
//       ),
//       child: Icon(
//         status == mosafer.MessageStatus.notSent ? Icons.close : Icons.done,
//         size: 8,
//         color: Theme.of(context).scaffoldBackgroundColor,
//       ),
//     );
//   }
// }
