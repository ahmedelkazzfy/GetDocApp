import 'package:flutter/material.dart';
import 'package:medicalassiss/config/constants/main_button.dart';
import 'package:medicalassiss/core/helpers/shared_preferences_manager.dart';
import 'package:medicalassiss/core/routing/routes_name.dart';
import 'package:medicalassiss/core/theming/colors.dart';
import 'package:medicalassiss/core/theming/styles.dart';

class ResultPage2 extends StatelessWidget {
  final Map<int, int> answers;
  final int totalQuestions;

  const ResultPage2(
      {required this.answers, required this.totalQuestions, super.key});

  // Calculate the overall score
  double _calculateScore() {
    if (answers.isEmpty) {
      return 0.0; // Default score for no answers provided
    }
    int totalScore = answers.values.reduce((a, b) => a + b);
    return (totalScore / (totalQuestions * 4)) * 100; // Percentage
  }

  // Calculate the category score (assuming 5 questions per category)
  double _calculateCategoryScore(int startIndex) {
    int categoryScore = 0;
    for (int i = startIndex; i < startIndex + 5; i++) {
      if (answers.containsKey(i)) {
        categoryScore += answers[i]!;
      }
    }
    return (categoryScore / 20) * 100; // Category score percentage (max 100%)
  }

  // Get feedback for each category based on score
  String _getCategoryFeedback(double score, String category) {
    if (score > 75) {
      return "$category: Excellent performance! You're doing great in this area.";
    } else if (score > 50) {
      return "$category: Good, but there's room for improvement.";
    } else {
      return "$category: Needs Improvement. Consider focusing on this area for better results.";
    }
  }

  // Get category result based on score
  String _getCategoryResult(double score) {
    if (score > 75) {
      return 'Excellent';
    } else if (score > 50) {
      return 'Good';
    } else {
      return 'Needs Improvement';
    }
  }

  @override
  Widget build(BuildContext context) {
    final double score = _calculateScore();

    // Handling the case where no answers were given
    String resultMessage = score == 0.0
        ? "You haven't answered any questions yet. Please take the quiz to get a result."
        : "Your Health Analysis";

    // Calculate scores for each category
    final mentalHealthScore = _calculateCategoryScore(0);
    final physicalHealthScore = _calculateCategoryScore(5);
    final stressLevelScore = _calculateCategoryScore(10);
    final overallWellBeingScore = _calculateCategoryScore(15);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Your Results", style: TextStyles.appBarTextStyle),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  resultMessage,
                  style: TextStyles.font24BlackBold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Show score only if answers exist
                if (score > 0.0)
                  Text(
                    "Overall Score: ${score.toStringAsFixed(1)}%",
                    style: TextStyles.headline1,
                  ),
                const SizedBox(height: 20),

                // Detailed analysis
                if (score > 0.0) ...[
                  Text(
                    "Detailed Analysis:",
                    style: TextStyles.font24BlackBold,
                  ),
                  const SizedBox(height: 10),

                  // Mental Health
                  Text(
                    "Mental Health: ${_getCategoryResult(mentalHealthScore)} (${mentalHealthScore.toStringAsFixed(1)}%)",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    _getCategoryFeedback(mentalHealthScore, "Mental Health"),
                    style: const TextStyle(
                        fontSize: 14, fontStyle: FontStyle.italic),
                  ),

                  // Physical Health
                  Text(
                    "Physical Health: ${_getCategoryResult(physicalHealthScore)} (${physicalHealthScore.toStringAsFixed(1)}%)",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    _getCategoryFeedback(
                        physicalHealthScore, "Physical Health"),
                    style: const TextStyle(
                        fontSize: 14, fontStyle: FontStyle.italic),
                  ),

                  // Stress Levels
                  Text(
                    "Stress Levels: ${_getCategoryResult(stressLevelScore)} (${stressLevelScore.toStringAsFixed(1)}%)",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    _getCategoryFeedback(stressLevelScore, "Stress Levels"),
                    style: const TextStyle(
                        fontSize: 14, fontStyle: FontStyle.italic),
                  ),

                  // Overall Well-being
                  Text(
                    "Overall Well-being: ${_getCategoryResult(overallWellBeingScore)} (${overallWellBeingScore.toStringAsFixed(1)}%)",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    _getCategoryFeedback(
                        overallWellBeingScore, "Overall Well-being"),
                    style: const TextStyle(
                        fontSize: 14, fontStyle: FontStyle.italic),
                  ),
                ],
                const SizedBox(height: 30),
                // Retake Quiz Button
                Center(
                  child: MainButton(
                    icon: Icons.restart_alt,
                    text: "Retake Quiz",
                    buttonColor: ColorManager.buttons,
                    iconColor: Colors.white,
                    func: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                //done button
                Center(
                  child: MainButton(
                    icon: Icons.check_circle_outline,
                    text: "Done",
                    buttonColor: Colors.green,
                    iconColor: Colors.white,
                    func: () async {
                      Map<String, dynamic> testResult = {
                        "Mental Health": mentalHealthScore,
                        "Physical Health": physicalHealthScore,
                        "Stress Levels": stressLevelScore,
                        "Overall Well-being": overallWellBeingScore,
                      };

                      SharedPreferencesManager preferencesManager =
                          SharedPreferencesManager();

                      await preferencesManager
                          .init(); // Initialize SharedPreferences
                      await preferencesManager.saveMap(
                          'test_result', testResult); // Save the result

                      //navigate to home
                      Navigator.pushNamedAndRemoveUntil(
                          context, RoutesName.home, ((route) => false));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
