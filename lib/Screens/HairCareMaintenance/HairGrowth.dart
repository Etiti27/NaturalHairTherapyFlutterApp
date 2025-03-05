import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Constants.dart';
import 'package:natural_hair_therapist/Screens/HairCareMaintenance/HairGrowth2.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';
import '../../../Widgets/GrowYourHairWelcome.dart';

class HairGrowth extends StatefulWidget {
  const HairGrowth({super.key});
  static const String id = "hairGrowth";

  @override
  State<HairGrowth> createState() => _HairGrowthState();
}

class _HairGrowthState extends State<HairGrowth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'HAIR Growth',
        subheader: 'A Natural Process, Not a Product',
        note: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kHAIRGROWTH1,
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
          Navigator.pushNamed(context, HairGrowth2.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
