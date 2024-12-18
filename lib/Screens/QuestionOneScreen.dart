import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Methods/ProviderPackage.dart';
import 'package:natural_hair_therapist/Screens/QuestionTwoScreen.dart';
import 'package:natural_hair_therapist/Widgets/AppBarWidget.dart';
import 'package:natural_hair_therapist/Widgets/BottomWidget.dart';
import 'package:provider/provider.dart';

import '../Widgets/QuestionScreenWidget.dart';

class Questiononescreen extends StatelessWidget {
  static const String id = "questiononescreen";

  const Questiononescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    return Scaffold(
      appBar: AppBarWidget(),
      body: questionScreens(
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
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
