import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Nutriton/classesInsideNutrition/NutritionMode.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';
import '../../../Widgets/GrowYourHairWelcome.dart';
import 'Sleep3.dart';

class sleep2 extends StatefulWidget {
  const sleep2({super.key});
  static const String id = "sleep2";

  @override
  State<sleep2> createState() => _sleep2State();
}

class _sleep2State extends State<sleep2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'SLEEP MANAGEMENT',
        subheader: 'Why Sleep Matters for Hair',
        note: NutritionModal(
          text2:
              """During sleep, your body releases melatonin, a hormone that plays a role in regulating the hair growth cycle. Poor or insufficient sleep can disrupt this cycle, causing slowed growth, increased shedding, or weakened strands over time. 
              
              Sleep is not just rest. It’s a biological reset, a recovery session for your hair.""",
        ),
        nextButton: () {
          Navigator.pushNamed(context, sleep3.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
