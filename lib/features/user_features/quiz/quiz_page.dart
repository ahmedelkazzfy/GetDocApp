import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicalassiss/core/theming/colors.dart';
import 'package:medicalassiss/core/theming/styles.dart';
import 'package:medicalassiss/features/user_features/quiz/provider/quiz_provider.dart';
import 'package:medicalassiss/features/user_features/quiz/widgets/result_page.dart';

import 'package:provider/provider.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Personality & Health Quiz",
            style: TextStyles.appBarTextStyle,
          ),
          centerTitle: true,
          // backgroundColor: Colors.deepPurple,
        ),
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFeef2f3),
                  Color(0xFFeef2f3),
                  Color(0xFFeef2f3),
                  Color(0xFFeef2f3),
                  Color.fromARGB(255, 187, 232, 239),
                  Color.fromARGB(255, 184, 238, 245),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: const QuizContent()),
      ),
    );
  }
}

class QuizContent extends StatefulWidget {
  const QuizContent({super.key});

  @override
  _QuizContentState createState() => _QuizContentState();
}

class _QuizContentState extends State<QuizContent> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: provider.questions.length,
                itemBuilder: (context, index) {
                  return QuestionCard(
                    question: provider.questions[index],
                    onChanged: (value) => provider.updateAnswer(index, value),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.buttons,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
                onPressed: () {
                  final results = provider.calculateResults();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(results),
                    ),
                  );
                },
                child: Text(
                  "Submit",
                  style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class QuestionCard extends StatefulWidget {
  final String question;
  final ValueChanged<double> onChanged;

  const QuestionCard({
    super.key,
    required this.question,
    required this.onChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  double _sliderValue = 5;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.question,
              style: TextStyles.headline1.copyWith(
                fontSize: 16.sp,
              ),
            ),
            Slider(
              min: 1,
              max: 10,
              divisions: 9,
              value: _sliderValue,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
                widget.onChanged(value); // Update the provider's value
              },
              activeColor: ColorManager.buttons,
              inactiveColor: Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }
}
