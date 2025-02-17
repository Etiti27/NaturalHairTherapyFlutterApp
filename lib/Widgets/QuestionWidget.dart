import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return questionScreens(
      questionnaire: questionnaire,
      image: Image.asset(
        "assets/images/logo.png",
        height: 100,
        // width: 70,
      ),
      text: "How often do you include foods high in protein in your diet?",
      listOfAnswer: const [
        "Daily",
        "A few times a week",
        "Rarely",
        "Never",
      ],
      OnChange: (value) {
        questionnaire.updateNutritionAnswer1(value);
      },
      prevButtonAppearance: ElevatedButton(
        onPressed: () {
          debugPrint("screen 1 prev button pressed");
          Navigator.pop(context);
        },
        child: const Text("<< prev"),
      ),
      nextButtonAppearance: ElevatedButton(
        onPressed: () {
          debugPrint("screen 1 next button pressed");
          Navigator.pushNamed(context, Questiontwoscreen.id);
        },
        child: const Text("next >>"),
      ),
    ),;
  }
}
