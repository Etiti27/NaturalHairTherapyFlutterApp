import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Methods/ProviderPackage.dart';
import 'package:provider/provider.dart';

import '../Widgets/QuestionDynamics.dart';

class Question2 extends StatelessWidget {
  static const String id = "Question2";

  const Question2({super.key});

  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    return QuestionsDynamics(
      questionnaire: questionnaire,
      questionnairAnswer: questionnaire.getHairGrowthAnswer2(),
      OnChange: (String? value) {
        questionnaire.updateHairGrowthAnswer2(value);
      },
      list: const ["Yes", "Regularly", "Occasionally", "No"],
    );
  }
}
