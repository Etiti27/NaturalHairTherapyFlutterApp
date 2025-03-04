import 'package:flutter/material.dart';

import '../Constants.dart';

class SecondaryNavigation extends StatelessWidget {
  SecondaryNavigation({
    super.key,
    required this.title,
  });
  String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: kPrimaryColor,
            fontFamily: "Roboto-bold",
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
