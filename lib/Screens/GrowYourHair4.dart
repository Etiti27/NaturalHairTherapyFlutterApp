import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Screens/Questions/1Question.dart';

import '../Widgets/AppBarWidget.dart';
import '../Widgets/BottomWidget.dart';
import '../Widgets/GrowYourHairWelcome.dart';

class Growyourhair4 extends StatefulWidget {
  const Growyourhair4({super.key});
  static const String id = "growyourhair4";

  @override
  State<Growyourhair4> createState() => _Growyourhair4State();
}

class _Growyourhair4State extends State<Growyourhair4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'Grow Your Hair',
        subheader: 'Welcome to Your Hair Growth Journey!',
        note: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              """To make this experience as personal as possible, let’s take a quick look at your current habits and routines.
              Don’t worry—it’s simple and only takes a minute!
            """,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
        nextButton: () {
          Navigator.pushNamed(context, Questiononescreen.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
