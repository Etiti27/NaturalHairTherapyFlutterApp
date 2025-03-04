import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Constants.dart';

import '../../Widgets/AppBarWidget.dart';
import '../../Widgets/BottomWidget.dart';
import '../../Widgets/GrowYourHairWelcome.dart';
import 'Ingredient3.dart';

class Ingredient2 extends StatefulWidget {
  const Ingredient2({super.key});
  static const String id = "ingredient2";

  @override
  State<Ingredient2> createState() => _Ingredient2State();
}

class _Ingredient2State extends State<Ingredient2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'INGREDIENT',
        subheader: 'What Are Ingredients?',
        note: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kINGREDIENT2,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
        nextButton: () {
          Navigator.pushNamed(context, Ingredient3.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
