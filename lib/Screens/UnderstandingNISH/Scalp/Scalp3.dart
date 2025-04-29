import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Nutriton/classesInsideNutrition/NutritionMode.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Scalp/Scalp4.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';
import '../../../Widgets/GrowYourHairWelcome.dart';

class scalp3 extends StatefulWidget {
  const scalp3({super.key});
  static const String id = "scalp3";

  @override
  State<scalp3> createState() => _scalp3State();
}

class _scalp3State extends State<scalp3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'SCALP CARE',
        subheader: 'The Womb of the Hair Deserves Daily Love',
        note: NutritionModal(
          text2:
              "That’s why scalp care is about more than solving dandruff or itchiness. It’s a proactive practice that supports growth, strength, and resilience.",
        ),
        nextButton: () {
          Navigator.pushNamed(context, scalp4.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
