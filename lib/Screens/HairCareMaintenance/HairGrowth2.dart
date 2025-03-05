import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Constants.dart';
import 'package:natural_hair_therapist/Screens/HairCareMaintenance/HairMaintenance.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';
import '../../../Widgets/GrowYourHairWelcome.dart';

class HairGrowth2 extends StatefulWidget {
  const HairGrowth2({super.key});
  static const String id = "hairGrowth2";

  @override
  State<HairGrowth2> createState() => _HairGrowth2State();
}

class _HairGrowth2State extends State<HairGrowth2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'HAIR Growth',
        subheader: 'Nutrition: The Foundation of Healthy Hair Growth',
        note: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kHAIRGROWTH2,
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
          Navigator.pushNamed(context, HairMaintenance.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
