import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/HairMain/HairMaint3.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Nutriton/classesInsideNutrition/NutritionMode.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';
import '../../../Widgets/GrowYourHairWelcome.dart';

class hairMaint2 extends StatefulWidget {
  const hairMaint2({super.key});
  static const String id = "hairMaint2";

  @override
  State<hairMaint2> createState() => _hairMaint2State();
}

class _hairMaint2State extends State<hairMaint2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'Hair maintenance & Length Retention',
        subheader: 'Protect What You’ve Grown',
        note: NutritionModal(
          text2:
              """In the Natural Hair Therapist point of view, hair care is the whole umbrella—the full NIS³H system that supports the growth and retention of healthy hair.
              
              Hair maintenance, however, is just one part of that. It refers to the daily and weekly routines, tools, and techniques you use to protect and manage the strands that have already grown out of your scalp.""",
        ),
        nextButton: () {
          Navigator.pushNamed(context, hairMaint3.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
