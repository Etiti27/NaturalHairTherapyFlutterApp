import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Constants.dart';
import 'package:natural_hair_therapist/Screens/HairCareMaintenance/HairMaintenance3.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';
import '../../../Widgets/GrowYourHairWelcome.dart';

class HairMaintenance2 extends StatefulWidget {
  const HairMaintenance2({super.key});
  static const String id = "hairMaintenance2";

  @override
  State<HairMaintenance2> createState() => _HairMaintenance2State();
}

class _HairMaintenance2State extends State<HairMaintenance2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'HAIR MAINTENANCE',
        subheader: 'Tools, Products, and Methods',
        note: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kHAIRMAINTENANCE2,
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
          Navigator.pushNamed(context, HairMaintenance3.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
