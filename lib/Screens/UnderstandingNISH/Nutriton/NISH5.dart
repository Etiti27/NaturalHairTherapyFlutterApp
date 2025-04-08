import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Ingredient/Ingredient.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';
import '../../../Widgets/GrowYourHairWelcome.dart';

class NISH5 extends StatefulWidget {
  const NISH5({super.key});
  static const String id = "nish5";

  @override
  State<NISH5> createState() => _NISH5State();
}

class _NISH5State extends State<NISH5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'NUTRITION',
        subheader: '',
        note: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              """That’s why dry, brittle, or thinning hair is often a sign that your body isn’t getting enough of what it needs.
              
              If you want healthy hair, you have to start from the inside. That’s why, in the NIS³H framework, Nutrition comes first.
              
              But nutrition doesn’t stop with what you eat — it also includes how well your body absorbs those nutrients. This is why gut health is just as important. A well-functioning digestive system helps your body take in and use the goodness you give it.""",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        nextButton: () {
          Navigator.pushNamed(context, Ingredient.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
