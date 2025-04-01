import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Ingredient/Ingredient.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';
import '../../../Widgets/GrowYourHairWelcome.dart';

class NISH4 extends StatefulWidget {
  const NISH4({super.key});
  static const String id = "nish4";

  @override
  State<NISH4> createState() => _NISH4State();
}

class _NISH4State extends State<NISH4> {
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
              """Hair is made up of a tough protein called keratin. To produce strong, healthy strands, your body needs a steady supply of building blocks like protein, vitamins, and minerals. 
              
              If your nutrition is poor, your body will focus its energy on more vital organs first — and your hair will be the first to show signs of weakness.""",
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
