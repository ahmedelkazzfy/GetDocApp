import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:medicalassiss/features/chatbot/widgets/chat_input_field.dart';
import 'package:medicalassiss/features/chatbot/widgets/massages.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _userInput = TextEditingController();
  static const apiKey = "AIzaSyAopiYlc-PG4iR7HLu0HVf8wY_VFfgXX6s";
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
  final List<Message> _messages = [];

  // Flag to track if the text input is empty
  bool isInputEmpty = true;

  @override
  void initState() {
    super.initState();
    // Add listener to the text controller
    _userInput.addListener(() {
      setState(() {
        isInputEmpty = _userInput.text.isEmpty;
      });
    });
  }

  Future<void> sendMessage() async {
    final message = _userInput.text;
    setState(() {
      _messages
          .add(Message(isUser: true, message: message, date: DateTime.now()));
    });
    final content = [Content.text(message)];
    final response = await model.generateContent(content);
    setState(() {
      _messages.add(Message(
        isUser: false,
        message: response.text ?? "",
        date: DateTime.now(),
      ));
    });
  }

  AppBar buildAppBar() {
    const kDefaultPadding = 20.0;
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              // begin: Alignment.topCenter,
              // end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.green.withOpacity(0.2),
                Colors.transparent,
              ]),
        ),
      ),
      automaticallyImplyLeading: false,
      title: const Row(
        children: [
          BackButton(),
          CircleAvatar(
            backgroundImage:
                AssetImage("assets/images/chatbot_screen/robot.png"),
          ),
          SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Medi-bot",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Active now",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () {},
        ),
        const SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green.withOpacity(0.2),
              Colors.transparent,
            ],
            stops: const [0.3, 1],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Messages(
                    isUser: message.isUser,
                    message: message.message,
                    date: DateFormat('HH:mm').format(message.date),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 20,
                    child: ChatInputField(
                      chatController: _userInput,
                    ),
                  ),
                  const Spacer(),
                  // Only show IconButton if text field is not empty
                  if (!isInputEmpty)
                    IconButton(
                      padding: const EdgeInsets.all(12),
                      iconSize: 25,
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Colors.green[200],
                        ),
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                        shape: WidgetStateProperty.all(const CircleBorder()),
                      ),
                      onPressed: () {
                        sendMessage();
                        _userInput.text = '';
                      },
                      icon: const Icon(
                        Icons.send,
                        // color: Colors.green,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
