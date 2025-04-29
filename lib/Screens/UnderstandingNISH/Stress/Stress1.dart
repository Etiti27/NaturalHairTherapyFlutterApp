import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Nutriton/classesInsideNutrition/NutritionMode.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Stress/Stress2.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';
import '../../../Widgets/GrowYourHairWelcome.dart';

class stress1 extends StatefulWidget {
  const stress1({super.key});
  static const String id = "stress1";

  @override
  State<stress1> createState() => _stress1State();
}

class _stress1State extends State<stress1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'STRESS MANAGEMENT',
        subheader: 'Stress and Hair Don’t Mix',
        note: NutritionModal(
          text1: "Why Stress Affects Hair",
          text2:
              """Stress isn’t just a feeling—it’s a physical response inside the body. And your hair feels it too.

When you’re stressed, your body produces hormones like cortisol and adrenaline, which are designed to help you survive short-term danger.""",
        ),
        nextButton: () {
          Navigator.pushNamed(context, stress2.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
