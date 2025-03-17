import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Constants.dart';
import 'package:natural_hair_therapist/Methods/ProviderPackage.dart';
import 'package:natural_hair_therapist/Screens/QuestionThreeScreen.dart';
import 'package:natural_hair_therapist/Widgets/AppBarWidget.dart';
import 'package:natural_hair_therapist/Widgets/BottomWidget.dart';
import 'package:natural_hair_therapist/Widgets/RadioSelect.dart';
import 'package:provider/provider.dart';

import '../Widgets/QuestionScreenWidget.dart';

class Questiontwoscreen extends StatefulWidget {
  static const String id = "questionTwoScreen";

  const Questiontwoscreen({super.key});

  @override
  State<Questiontwoscreen> createState() => _QuestiontwoscreenState();
}

class _QuestiontwoscreenState extends State<Questiontwoscreen> {
  String selected = "7-8 Hours";
  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            QuestionScreens(
              questionnaireAnswer: questionnaire.getHairGrowthAnswer4(),
              // questionnaire: questionnaire.nutritionAnswer1,
              text:
                  "Are you aware of any ingredients that might harm your hair’s health or cause dryness?",
              listOfAnswer: const [
                "Sodium Lauryl Sulfate (SLS)",
                "Mineral Oil",
                "Sodium Laureth Sulphate",
                "Isopropyl Alcohol",
              ],
              OnChange: (value) {
                questionnaire.updateHairGrowthAnswer4(value);
              },
            ),
            QuestionScreens(
              questionnaireAnswer: questionnaire.getHairGrowthAnswer5(),
              text:
                  "Do you regularly massage your scalp or use scalp-specific treatments?",
              listOfAnswer: const [
                "Yes",
                "Regularly",
                "Occasionally",
                "No",
              ],
              OnChange: (value) {
                questionnaire.updateHairGrowthAnswer5(value);
              },
            ),
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
                    Navigator.pushNamed(context, Questionthreescreen.id);
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
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
