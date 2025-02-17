import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Constants.dart';
import 'package:natural_hair_therapist/Methods/ProviderPackage.dart';
import 'package:natural_hair_therapist/Widgets/AppBarWidget.dart';
import 'package:natural_hair_therapist/Widgets/BottomWidget.dart';
import 'package:provider/provider.dart';

import '../Widgets/QuestionScreenWidget.dart';
import 'QuestionTwoScreen.dart';

class Questiononescreen extends StatelessWidget {
  static const String id = "questiononescreen";

  const Questiononescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    return Scaffold(
      appBar: AppBarWidget(),
      body: Column(
        children: [
          questionScreens(
            questionnaire: questionnaire,
            text:
                "How often do you include foods high in protein in your diet?",
            listOfAnswer: const [
              "Daily",
              "A few times a week",
              "Rarely",
              "Never",
            ],
            OnChange: (value) {
              questionnaire.updateNutritionAnswer1(value);
            },
          ),
          questionScreens(
            questionnaire: questionnaire,
            text:
                "How often do you include foods high in protein in your diet?",
            listOfAnswer: const [
              "Daily",
              "A few times a week",
              "Rarely",
              "Never",
            ],
            OnChange: (value) {
              questionnaire.updateNutritionAnswer1(value);
            },
          ),
          questionScreens(
            questionnaire: questionnaire,
            text:
                "How often do you include foods high in protein in your diet?",
            listOfAnswer: const [
              "Daily",
              "A few times a week",
              "Rarely",
              "Never",
            ],
            OnChange: (value) {
              questionnaire.updateNutritionAnswer1(value);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                ),
                onPressed: () {
                  debugPrint("screen 1 prev button pressed");
                  Navigator.pop(context);
                },
                child: const Text(
                  "<< prev",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                ),
                onPressed: () {
                  debugPrint("screen 1 next button pressed");
                  Navigator.pushNamed(context, Questiontwoscreen.id);
                },
                child: const Text(
                  "next >>",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
