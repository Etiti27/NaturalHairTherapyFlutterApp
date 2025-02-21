import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Methods/ProviderPackage.dart';
import 'package:provider/provider.dart';

import '../Widgets/QuestionDynamics.dart';

class Question7 extends StatelessWidget {
  static const String id = "Question7";

  const Question7({super.key});

  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    return QuestionsDynamics(
      questionnaire: questionnaire,
      questionnairAnswer: questionnaire.getHairGrowthAnswer7(),
      OnChange: (String? value) {
        questionnaire.updateHairGrowthAnswer7(value!);
      },
      list: ["Yes, every night", "Sometimes", "Never"],
    );
  }
}
