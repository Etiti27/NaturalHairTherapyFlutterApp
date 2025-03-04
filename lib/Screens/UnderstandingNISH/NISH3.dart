import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Constants.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/NISH4.dart';

import '../../Widgets/AppBarWidget.dart';
import '../../Widgets/BottomWidget.dart';
import '../../Widgets/GrowYourHairWelcome.dart';

class NISH3 extends StatefulWidget {
  const NISH3({super.key});
  static const String id = "nish3";

  @override
  State<NISH3> createState() => _NISH3State();
}

class _NISH3State extends State<NISH3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'NUTRITION',
        subheader: 'The Role of Gut Health',
        note: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kNISH3,
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
          Navigator.pushNamed(context, NISH4.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
