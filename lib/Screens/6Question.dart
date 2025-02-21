import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Constants.dart';
import 'package:natural_hair_therapist/Methods/ProviderPackage.dart';
import 'package:natural_hair_therapist/Widgets/AppBarWidget.dart';
import 'package:natural_hair_therapist/Widgets/BottomWidget.dart';
import 'package:provider/provider.dart';

import '../Widgets/QuestionDynamics.dart';
import '../Widgets/RadioSelect.dart';
import '7Question.dart';

class Question6 extends StatefulWidget {
  static const String id = "Question6";

  const Question6({super.key});

  @override
  State<Question6> createState() => _Question6State();
}

class _Question6State extends State<Question6> {
  String selected = "7-8 Hours";
  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    return QuestionsDynamics(
      questionnaire: questionnaire,
      questionnairAnswer: questionnaire.getHairGrowthAnswer6(),
      OnChange: (String? value) {
        questionnaire.updateHairGrowthAnswer6(value!);
      },
      list: const ["7-8 Hours", "5-6 Hours", "Less than 5 Hours"],
    );

    Scaffold(
      appBar: AppBarWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LinearProgressIndicator(value: questionnaire.getProgress()),
          DynamicRadioSelect(
            options: const ["7-8 Hours", "5-6 Hours", "Less than 5 Hours"],
            selectedValue: selected,
            OnChange: (value) {
              setState(() {
                selected = value!;
                print("yes");
              });

              questionnaire.updateHairGrowthAnswer6(selected);
              if (kDebugMode) {
                print(questionnaire.getHairGrowthAnswer6());
              }
            },
            texts: "How many hours of sleep do you usually get per night?",
            prevButtonAppearance: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                debugPrint("screen 1 prev button pressed");
                Navigator.pop(context);
              },
              child: const Text(
                "<< prev",
                style: TextStyle(color: kPrimaryColor),
              ),
            ),
            nextButtonAppearance: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                if (questionnaire.getCurrentPage() + 1 <
                    questionnaire.getTotalPage()) {
                  questionnaire.updateProgress(questionnaire.getTotalPage());
                } else {
                  // Reset Progress on completion
                  questionnaire.resetProgress();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("You've completed all questions!")),
                  );
                }

                debugPrint("screen 1 next button pressed");
                Navigator.pushNamed(context, Question7.id);
              },
              child: const Text(
                "next >>",
                style: TextStyle(color: kPrimaryColor),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
