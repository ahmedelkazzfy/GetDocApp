import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Message {
  final bool isUser;
  final String message;
  final DateTime date;
  Message({required this.isUser, required this.message, required this.date});
}

class Messages extends StatelessWidget {
  final bool isUser;
  final String message;
  final String date;
  const Messages(
      {super.key,
      required this.isUser,
      required this.message,
      required this.date});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10).r,
      margin: const EdgeInsets.symmetric(vertical: 15)
          .h
          .copyWith(left: isUser ? 100 : 10, right: isUser ? 10 : 100),
      decoration: BoxDecoration(
        color: isUser
            ? Colors.green.withOpacity(0.4)
            : const Color.fromARGB(255, 222, 217, 217),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(40).r,
          bottomLeft: isUser ? const Radius.circular(30).r : Radius.zero,
          topRight: const Radius.circular(40).r,
          bottomRight: isUser ? Radius.zero : const Radius.circular(60).r,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                isUser == true
                    ? "assets/images/chatbot_screen/man.png"
                    : "assets/images/chatbot_screen/robot.png",
                height: 30,
                width: 30,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    message,
                    style: TextStyle(
                        fontSize: 14,
                        color: isUser ? Colors.white : Colors.black),
                  ),
                ),
              ),
            ],
          ),
          Text(
            date,
            style: TextStyle(
              fontFamily: 'cairo',
              fontSize: 10.sp,
              color: isUser ? Colors.white : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
