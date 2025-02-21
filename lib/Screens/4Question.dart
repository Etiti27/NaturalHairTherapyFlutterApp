import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Methods/ProviderPackage.dart';
import 'package:provider/provider.dart';

import '../Widgets/QuestionDynamics.dart';

class Question4 extends StatefulWidget {
  static const String id = "Question4";

  const Question4({super.key});

  @override
  _Question4State createState() => _Question4State();
}

class _Question4State extends State<Question4> {
  String feedback = "";

  // ✅ Store feedback messages in a Map for better readability
  final Map<String, String> feedbackMessages = {
    "Sodium Lauryl Sulfate":
        "Sodium Lauryl Sulfate is a strong cleanser that can strip natural oils from the hair and scalp, leading to dryness and irritation. If possible, look for gentler sulfate-free cleansers.",
    "Mineral Oil":
        "Mineral oil creates a barrier on the hair but doesn’t add moisture. It can weigh down hair and block other nourishing ingredients from penetrating. Consider using natural oils like coconut or jojoba instead.",
    "Sodium Laureth Sulphate":
        "Sodium Laureth Sulfate is milder than some sulfates but may still strip oils from hair. If you have dry or sensitive hair, use it sparingly or choose sulfate-free options.",
    "Isopropyl Alcohol":
        "Isopropyl Alcohol is best avoided for hair, as it can be very drying and lead to breakage. Look for alcohol-free or fatty alcohol-based alternatives instead."
  };

  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);

    return QuestionsDynamics(
      feedback: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          feedback, // ✅ Updates dynamically
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      questionnaire: questionnaire,
      questionnairAnswer: questionnaire.getHairGrowthAnswer4(),
      OnChange: (String? value) {
        if (value != null) {
          questionnaire.updateHairGrowthAnswer4(value);

          // ✅ Update feedback dynamically
          setState(() {
            feedback = feedbackMessages[value] ?? "Please select an option.";
          });
        }
      },
      list: feedbackMessages.keys.toList(), // ✅ Generates options from keys
    );
  }
}
