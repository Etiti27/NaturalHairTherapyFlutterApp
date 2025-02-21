import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Methods/ProviderPackage.dart';
import 'package:provider/provider.dart';

import '../Widgets/QuestionDynamics.dart';

class Questiononescreen extends StatefulWidget {
  static const String id = "Question1";

  const Questiononescreen({super.key});

  @override
  State<Questiononescreen> createState() => _QuestiononescreenState();
}

class _QuestiononescreenState extends State<Questiononescreen> {
  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    return QuestionsDynamics(
      questionnaire: questionnaire,
      questionnairAnswer: questionnaire.getHairGrowthAnswer1(),
      OnChange: (String? value) {
        questionnaire.updateNutritionAnswer1(value!);
      },
      list: const ["Daily", "A few times a week", "Rarely", "Never"],
    );
  }
}
