import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/HairMain/HairMaint4.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Nutriton/classesInsideNutrition/NutritionMode.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';
import '../../../Widgets/GrowYourHairWelcome.dart';

class hairMaint3 extends StatefulWidget {
  const hairMaint3({super.key});
  static const String id = "hairMaint3";

  @override
  State<hairMaint3> createState() => _hairMaint3State();
}

class _hairMaint3State extends State<hairMaint3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'Hair maintenance & Length Retention',
        subheader: 'Protect What You’ve Grown',
        note: NutritionModal(
          text2:
              """Hair maintenance doesn’t grow your hair — that happens from the inside.

But it does determine whether the hair you’ve grown stays on your head or breaks off.”""",
        ),
        nextButton: () {
          Navigator.pushNamed(context, HairMaint4.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
