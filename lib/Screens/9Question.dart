import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Methods/ProviderPackage.dart';
import 'package:provider/provider.dart';

import '../Widgets/QuestionDynamics.dart';

class Question9 extends StatelessWidget {
  static const String id = "Question9";

  const Question9({super.key});

  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    return QuestionsDynamics(
      questionnaire: questionnaire,
      questionnairAnswer: questionnaire.getHairGrowthAnswer9(),
      OnChange: (String? value) {
        questionnaire.updateHairGrowthAnswer9(value!);
      },
      list: const ["Yes, regularly", "Occasionally", "No"],
    );
  }
}
