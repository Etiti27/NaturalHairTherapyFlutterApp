import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Constants.dart';
import 'package:natural_hair_therapist/Methods/secondaryNavigation.dart';
import 'package:natural_hair_therapist/Screens/question_one.dart';

import '../Widgets/AppBarWidget.dart';
import '../Widgets/BottomWidget.dart';

class Growyourhair extends StatefulWidget {
  const Growyourhair({super.key});
  static const String id = "growyourhair";

  @override
  State<Growyourhair> createState() => _GrowyourhairState();
}

class _GrowyourhairState extends State<Growyourhair> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SecondaryNavigation(
              title: "Grow Your Hair",
            ),
            const Text(
              "Welcome to Your Hair Growth Journey!",
              style: TextStyle(
                  fontSize: 20.0,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Card(
                color: kPrimaryColor,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    kGrowYourHairText,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "<< prev",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                  onPressed: () {
                    Navigator.pushNamed(context, Questiononescreen.id);
                  },
                  child: const Text(
                    "Start Growth Assessment >>",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
