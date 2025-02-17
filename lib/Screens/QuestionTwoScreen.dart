import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Widgets/AppBarWidget.dart';
import 'package:natural_hair_therapist/Widgets/BottomWidget.dart';
import 'package:natural_hair_therapist/Widgets/QuestionScreenWidget.dart';
import 'package:provider/provider.dart';

import '../Methods/ProviderPackage.dart';

class Questiontwoscreen extends StatefulWidget {
  const Questiontwoscreen({super.key});
  static const String id = "questiontwoscreen";

  @override
  State<Questiontwoscreen> createState() => _QuestiontwoscreenState();
}

class _QuestiontwoscreenState extends State<Questiontwoscreen> {
  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    return Scaffold(
      appBar: AppBarWidget(),
      body: questionScreens(
        questionnaire: questionnaire,
        // image: Image.asset(
        //   "assets/images/logo.png",
        //   height: 100,
        //   // width: 70,
        // ),
        text:
            "Do you take any supplements (e.g., vitamins, minerals) specifically for hair or general health?",
        listOfAnswer: const [
          "Regularly",
          "Occasionally",
          "Rarely",
          "Never",
        ],
        OnChange: (value) {
          questionnaire.updateNutritionAnswer2(value);
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
