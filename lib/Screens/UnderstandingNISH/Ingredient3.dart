import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Constants.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Ingredient4.dart';

import '../../Widgets/AppBarWidget.dart';
import '../../Widgets/BottomWidget.dart';
import '../../Widgets/GrowYourHairWelcome.dart';

class Ingredient3 extends StatefulWidget {
  const Ingredient3({super.key});
  static const String id = "ingredient3";

  @override
  State<Ingredient3> createState() => _Ingredient3State();
}

class _Ingredient3State extends State<Ingredient3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'INGREDIENT',
        subheader: 'Categories of Ingredients in Hair Maintenance Products',
        note: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kINGREDIENT3,
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
          Navigator.pushNamed(context, Ingredient4.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
