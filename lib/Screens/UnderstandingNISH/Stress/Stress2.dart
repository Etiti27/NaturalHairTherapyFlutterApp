import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Nutriton/classesInsideNutrition/NutritionMode.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Stress/Stress3.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';
import '../../../Widgets/GrowYourHairWelcome.dart';

class stress2 extends StatefulWidget {
  const stress2({super.key});
  static const String id = "stress2";

  @override
  State<stress2> createState() => _stress2State();
}

class _stress2State extends State<stress2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'STRESS MANAGEMENT',
        subheader: 'Stress and Hair Don’t Mix',
        note: NutritionModal(
          text2:
              """But when those hormones stick around too long, they create inflammation, nutrient depletion, and blood flow disruption—especially to areas the body doesn’t consider vital… like your hair follicles.""",
        ),
        nextButton: () {
          Navigator.pushNamed(context, stress3.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
