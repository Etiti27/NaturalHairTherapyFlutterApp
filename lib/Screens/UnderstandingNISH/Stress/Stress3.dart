import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Nutriton/classesInsideNutrition/NutritionMode.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Stress/Stress4.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';
import '../../../Widgets/GrowYourHairWelcome.dart';

class stress3 extends StatefulWidget {
  const stress3({super.key});
  static const String id = "stress3";

  @override
  State<stress3> createState() => _stress3State();
}

class _stress3State extends State<stress3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'STRESS MANAGEMENT',
        subheader: 'This is why stress is linked to:',
        note: NutritionModal(
          text2: """•	Hair thinning
	•	Increased shedding
	•	Slower hair growth
	•	Scalp irritation or inflammation

In NHT philosophy, we understand that supporting hair health means supporting whole-body calm. 

You can be eating all the right foods and using great products, but if your stress is high, your results will be limited.”
""",
        ),
        nextButton: () {
          Navigator.pushNamed(context, stress4.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
