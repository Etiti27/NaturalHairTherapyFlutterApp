import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Constants.dart';

class BottomWidget extends StatelessWidget {
  DateTime now = DateTime.now();

  BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int year = now.year;
    // print('Current date and time: $year');
    return Container(
      color: kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Natural Hair Therapist \n copyright © $year",
          style: const TextStyle(color: Colors.white, fontSize: 20.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
