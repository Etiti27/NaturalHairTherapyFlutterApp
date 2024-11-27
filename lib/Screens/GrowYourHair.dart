import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Constants.dart';
import 'package:natural_hair_therapist/Methods/secondaryNavigation.dart';

import '../Widgets/AppBarWidget.dart';

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
      body: Column(
        children: [
          SecondaryNavigation(
            title: "Grow Your Hair",
          ),
          const Text(
            "Welcome to Your Hair Growth Journey!",
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              kGrowYourHairText,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
