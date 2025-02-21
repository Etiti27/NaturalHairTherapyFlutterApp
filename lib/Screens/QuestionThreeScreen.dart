import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Constants.dart';
import 'package:natural_hair_therapist/Methods/ProviderPackage.dart';
import 'package:natural_hair_therapist/Widgets/AppBarWidget.dart';
import 'package:natural_hair_therapist/Widgets/BottomWidget.dart';
import 'package:provider/provider.dart';

import '../Widgets/QuestionScreenWidget.dart';

class Questionthreescreen extends StatefulWidget {
  static const String id = "questionThreeScreen";

  const Questionthreescreen({super.key});

  @override
  State<Questionthreescreen> createState() => _QuestionthreescreenState();
}

class _QuestionthreescreenState extends State<Questionthreescreen> {
  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            questionScreens(
              questionnaireAnswer: questionnaire.getHairGrowthAnswer7(),
              // questionnaire: questionnaire.nutritionAnswer1,
              text:
                  "Do you protect your hair at night with a silk scarf or pillowcase?",
              listOfAnswer: const [
                "Yes, every night",
                "Sometimes",
                "Never",
              ],
              OnChange: (value) {
                questionnaire.updateHairGrowthAnswer7(value);
              },
            ),
            questionScreens(
              questionnaireAnswer: questionnaire.getHairGrowthAnswer8(),
              text:
                  "How would you describe your stress levels on a daily basis?",
              listOfAnswer: const [
                "Low",
                "Moderate",
                "High",
              ],
              OnChange: (value) {
                questionnaire.updateHairGrowthAnswer8(value);
              },
            ),
            questionScreens(
              questionnaireAnswer: questionnaire.getHairGrowthAnswer9(),
              text:
                  "Do you have practices to manage stress, like exercise, meditation, or journaling?",
              listOfAnswer: const [
                "Yes, regularly",
                "Occasionally",
                "No",
              ],
              OnChange: (value) {
                questionnaire.updateHairGrowthAnswer9(value);
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
                    // Navigator.pushNamed(context, Questiontwoscreen.id);
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
