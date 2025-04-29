import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Nutriton/classesInsideNutrition/NutritionMode.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/sleep/Sleep2.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';
import '../../../Widgets/GrowYourHairWelcome.dart';

class sleep1 extends StatefulWidget {
  const sleep1({super.key});
  static const String id = "sleep1";

  @override
  State<sleep1> createState() => _sleep1State();
}

class _sleep1State extends State<sleep1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'SLEEP MANAGEMENT',
        subheader: 'While You Sleep, Your Hair Grows',
        note: NutritionModal(
          text1: "Why Sleep Matters for Hair",
          text2:
              "When we talk about hair care, people usually think of products and routines. But one of the most powerful hair growth boosters doesn’t come in a jar—it happens while you sleep. While your body rests, it repairs, regenerates, and rebalances. And yes—your hair is included in that process.",
        ),
        nextButton: () {
          Navigator.pushNamed(context, sleep2.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
