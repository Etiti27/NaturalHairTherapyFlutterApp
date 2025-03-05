import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Constants.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';
import '../../../Widgets/GrowYourHairWelcome.dart';
import 'HairMaintenance2.dart';

class HairMaintenance extends StatefulWidget {
  const HairMaintenance({super.key});
  static const String id = "hairMaintenance";

  @override
  State<HairMaintenance> createState() => _HairMaintenanceState();
}

class _HairMaintenanceState extends State<HairMaintenance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'HAIR MAINTENANCE',
        subheader: 'Introduction',
        note: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kHAIRMAINTENANCE1,
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
          Navigator.pushNamed(context, HairMaintenance2.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
