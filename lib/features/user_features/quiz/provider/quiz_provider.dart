import 'package:flutter/material.dart';

class QuizProvider extends ChangeNotifier {
  final List<String> questions = [
    "How often do you feel stressed during the day?",
    "How well do you sleep at night?",
    "Do you often feel anxious or worried?",
    "How motivated are you to achieve your goals?",
  ];

  final List<double> _answers = List.generate(4, (index) => 5);

  void updateAnswer(int index, double value) {
    _answers[index] = value;
    notifyListeners();
  }

  Map<String, double> calculateResults() {
    double stress = _answers[0] * 10;
    double sleep = (10 - _answers[1]) * 10;
    double anxiety = _answers[2] * 10;
    double motivation = (_answers[3] / 10) * 100;

    double total = stress + sleep + anxiety + motivation;

    return {
      "Stress Level": (stress / total) * 100,
      "Sleep Quality": (sleep / total) * 100,
      "Anxiety Level": (anxiety / total) * 100,
      "Motivation": (motivation / total) * 100,
    };
  }
}
