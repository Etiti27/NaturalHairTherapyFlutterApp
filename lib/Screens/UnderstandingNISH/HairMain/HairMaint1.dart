import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Nutriton/classesInsideNutrition/NutritionMode.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';
import '../../../Widgets/GrowYourHairWelcome.dart';
import 'HairMaint2.dart';

class hairMaint1 extends StatefulWidget {
  const hairMaint1({super.key});
  static const String id = "hairMaint1";

  @override
  State<hairMaint1> createState() => _hairMaint1State();
}

class _hairMaint1State extends State<hairMaint1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'Hair maintenance & Length Retention',
        subheader: 'Protect What You’ve Grown',
        note: NutritionModal(
          text1: "What Is Hair Maintenance?",
          text2:
              """Hair maintenance means protecting what your body has already grown. 
              These strands are no longer fed by your bloodstream — they’re biologically dead. 
              That’s why your job is to nourish, protect, and preserve them.
              
              When people talk about ‘hair care,’ they’re often actually talking about hair maintenance.""",
        ),
        nextButton: () {
          Navigator.pushNamed(context, hairMaint2.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
