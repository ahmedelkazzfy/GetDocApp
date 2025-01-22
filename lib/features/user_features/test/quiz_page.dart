import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/config/constants/main_button.dart';
import 'package:medicalassiss/core/theming/styles.dart';
import 'package:medicalassiss/features/user_features/test/result_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuizPage2 extends StatefulWidget {
  const QuizPage2({super.key});

  @override
  State<QuizPage2> createState() => _QuizPage2State();
}

class _QuizPage2State extends State<QuizPage2> {
  late final List<Map<String, dynamic>> _questions;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize questions here since context is now available
    _questions = List.generate(
      20,
      (index) => {
        'question': _generateQuestion(index),
        'options': _generateOptions(index), // Fetch options dynamically
      },
    );
  }

  // Now _generateQuestion is an instance method
  String _generateQuestion(int index) {
    List<String> questions =
        AppLocalizations.of(context)!.questions.split(', ');
    return questions[index % questions.length];
  }

  // Updated _generateOptions method
  List<String> _generateOptions(int index) {
    // Assuming options are stored in the localization file and separated by commas
    List<String> options = AppLocalizations.of(context)!
        .options
        .split(', '); // Split localized options
    // Return the options (assuming all questions share the same options for simplicity)
    return options;
  }

  // User answers
  final Map<int, int> _answers = {};
  final PageController _pageController = PageController();
  int _currentQuestionIndex = 0;

  void _onOptionSelected(int optionIndex) {
    setState(() {
      _answers[_currentQuestionIndex] = optionIndex;
    });
  }

  void _goToNextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToResult();
    }
  }

  void _goToPreviousQuestion() {
    if (_currentQuestionIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _navigateToResult() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage2(
          answers: _answers,
          totalQuestions: _questions.length,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Health & Psychology Quiz',
          style: TextStyles.appBarTextStyle,
        ),
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
        child: PageView.builder(
          controller: _pageController,
          itemCount: _questions.length,
          onPageChanged: (index) {
            setState(() {
              _currentQuestionIndex = index;
            });
          },
          itemBuilder: (context, index) {
            final question = _questions[index];
            final options =
                question['options'] as List<String>; // Correctly access options

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Question Text with a Fancy Container
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 57, 81, 93),
                          Color.fromARGB(255, 64, 93, 107),
                          Color.fromARGB(255, 93, 174, 211)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 1,
                          offset: const Offset(-5, 5),
                        ),
                      ],
                    ),
                    child: Text(
                      '${index + 1}. ${question['question']}',
                      style: TextStyles.headline,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Options in Grid View with more elegant button styles
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3.5,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: options.length,
                      itemBuilder: (context, i) {
                        final isSelected = _answers[index] == i;

                        return GestureDetector(
                          onTap: () {
                            _onOptionSelected(i);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              gradient: isSelected
                                  ? const LinearGradient(colors: [
                                      Color.fromARGB(255, 57, 81, 93),
                                      Color.fromARGB(255, 64, 93, 107),
                                      Color.fromARGB(255, 93, 174, 211)
                                    ])
                                  : LinearGradient(colors: [
                                      Colors.white,
                                      Colors.grey.shade300
                                    ]),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                options[i],
                                style: TextStyles.headline1.copyWith(
                                  fontSize: 16.sp,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Navigation Buttons with Hover Effect
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Next Question Button
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.shade600.withOpacity(0.2),
                              blurRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: MainButton(
                          icon: Icons.skip_next_sharp,
                          iconColor: Colors.white,
                          text: 'Next Question',
                          buttonColor: Colors.green.shade700,
                          func: _goToNextQuestion,
                        ),
                      ),
                      // Previous Question Button
                      if (_currentQuestionIndex > 0)
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    Colors.blueGrey.shade600.withOpacity(0.2),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: MainButton(
                            icon: Icons.skip_previous_sharp,
                            iconColor: Colors.white,
                            text: 'Previous',
                            buttonColor: Colors.blueGrey.shade700,
                            func: _goToPreviousQuestion,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
