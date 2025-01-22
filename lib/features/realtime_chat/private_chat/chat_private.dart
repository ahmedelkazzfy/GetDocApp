// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mosafer/config/core/alert_service.dart';
// import 'package:mosafer/config/core/colors.dart';
// import 'package:mosafer/screens/chat_screen/private_chat/widgets/chat_appbar.dart';
// import 'package:provider/provider.dart';
// import 'package:mosafer/provider/chat_provider.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:timeago/timeago.dart' as timeago;

// class PrivateChatPage extends StatefulWidget {
//   final String recieverName;
//   final String roomId;
//   final String senderId;
//   final String receiverId;

//   const PrivateChatPage({
//     super.key,
//     required this.recieverName,
//     required this.roomId,
//     required this.senderId,
//     required this.receiverId,
//   });

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<PrivateChatPage> {
//   final TextEditingController _controller = TextEditingController();
//   final ScrollController _scrollController = ScrollController();
//   late StreamSubscription<void> _messageSubscription;

//   @override
//   void initState() {
//     super.initState();
//     final chatProvider = Provider.of<ChatProvider>(context, listen: false);

//     // Fetch existing messages
//     chatProvider.fetchMessages(widget.roomId);

//     // Start listening for real-time updates
//     _messageSubscription = chatProvider.listenToMessages(widget.roomId);
//   }

//   @override
//   void dispose() {
//     // Cancel the subscription and dispose controllers
//     _messageSubscription.cancel();
//     _controller.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void _scrollToBottom() {
//     if (_scrollController.hasClients) {
//       _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final chatProvider = Provider.of<ChatProvider>(context);

//     // Wrap the messages list with Stream.value to turn it into a stream
//     final messageStream = Stream.value(chatProvider.messagessss);

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 228, 227, 227),
//       appBar: ChatAppBar(
//         senderName: widget.recieverName,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<List<Map<String, dynamic>>>(
//               stream: messageStream,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text("Error: ${snapshot.error}"));
//                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return Center(child: Text("No messages yet."));
//                 } else {
//                   final messages = snapshot.data!;

//                   // Scroll to bottom when new messages are added
//                   WidgetsBinding.instance.addPostFrameCallback((_) {
//                     _scrollToBottom();
//                   });

//                   return ListView.builder(
//                     controller: _scrollController,
//                     itemCount: messages.length,
//                     padding: EdgeInsets.symmetric(vertical: 10).r,
//                     itemBuilder: (context, index) {
//                       final message = messages[index];
//                       final isMe = message['profile_id'] == widget.senderId;

//                       return Padding(
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 4.0,
//                           horizontal: 8.0,
//                         ).r,
//                         child: Align(
//                           alignment: isMe
//                               ? Alignment.centerRight
//                               : Alignment.centerLeft,
//                           child: Column(
//                             crossAxisAlignment: isMe
//                                 ? CrossAxisAlignment.end
//                                 : CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 constraints: BoxConstraints(
//                                     maxWidth:
//                                         MediaQuery.of(context).size.width *
//                                             0.7),
//                                 padding: EdgeInsets.all(12),
//                                 decoration: BoxDecoration(
//                                   color: isMe
//                                       ? appBackgroundColor
//                                       : Colors.grey[200],
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(12),
//                                     topRight: Radius.circular(12),
//                                     bottomLeft: isMe
//                                         ? Radius.circular(12)
//                                         : Radius.zero,
//                                     bottomRight: isMe
//                                         ? Radius.zero
//                                         : Radius.circular(12),
//                                   ),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.black.withOpacity(0.1),
//                                       blurRadius: 4,
//                                       offset: Offset(0, 2),
//                                     ),
//                                   ],
//                                 ),
//                                 child: Text(
//                                   message['content'],
//                                   style: TextStyle(
//                                     color: isMe ? Colors.white : Colors.black87,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 4),
//                               Text(
//                                 timeago.format(
//                                     DateTime.parse(message['created_at'])),
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: CircleAvatar(
//                     backgroundColor: appBackgroundColor,
//                     child: IconButton(
//                       icon: Icon(Icons.mic_none_rounded, color: Colors.white),
//                       onPressed: () {},
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey[100],
//                       borderRadius: BorderRadius.circular(30),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 4,
//                           offset: Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: TextField(
//                       controller: _controller,
//                       decoration: InputDecoration(
//                         hintText: 'Type a message',
//                         border: InputBorder.none,
//                         contentPadding:
//                             EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 CircleAvatar(
//                   backgroundColor: appBackgroundColor,
//                   child: IconButton(
//                     icon: Icon(Icons.send, color: Colors.white),
//                     onPressed: () async {
//                       if (_controller.text.trim().isEmpty) {
//                         AlertService alertService = AlertService();
//                         alertService.showToast(
//                             text: "Message cannot be empty'",
//                             icon: Icons.info,
//                             context: context);
//                       } else {
//                         try {
//                           chatProvider.sendMessage(
//                             roomId: widget.roomId,
//                             senderId: widget.senderId,
//                             receiverId: widget.receiverId,
//                             content: _controller.text.trim(),
//                           );
//                           _controller.clear();
//                           FocusScope.of(context).unfocus();
//                         } on PostgrestException catch (error) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text(error.message)),
//                           );
//                         } catch (e) {
//                           AlertService alertService = AlertService();
//                           alertService.showToast(
//                               text: "Unexpected error occurred",
//                               icon: Icons.info,
//                               context: context);
//                         }
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
