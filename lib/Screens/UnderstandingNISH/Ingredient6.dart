import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Constants.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Ingredient7.dart';

import '../../Widgets/AppBarWidget.dart';
import '../../Widgets/BottomWidget.dart';
import '../../Widgets/GrowYourHairWelcome.dart';

class Ingredient6 extends StatefulWidget {
  const Ingredient6({super.key});
  static const String id = "ingredient6";

  @override
  State<Ingredient6> createState() => _Ingredient6State();
}

class _Ingredient6State extends State<Ingredient6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'INGREDIENT',
        subheader: 'Choosing Ingredients Based on Hair Needs',
        note: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kINGREDIENT6,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // SizedBox(height: 10),
            // Text(
            //   textAlign: TextAlign.justify,
            //   "NISH is a unique, holistic hair care framework developed by your Natural Hair Therapist (NHT) to give your body exactly what it needs for healthy hair growth.",
            //   style: TextStyle(
            //     fontSize: 25,
            //     color: Colors.white,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ],
        ),
        nextButton: () {
          Navigator.pushNamed(context, Ingredient7.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
