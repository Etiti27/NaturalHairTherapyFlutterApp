import 'package:flutter/material.dart';

import '../Methods/Card.dart';

class DashboardCard extends StatelessWidget {
  String imagePath;
  String title;
  final VoidCallback OnTap;

  DashboardCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.OnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Cards(
        image: Image.asset(
          imagePath,
          width: 100.0,
          // height: 50.0,
          fit: BoxFit.cover,
        ),
        onTap: OnTap,
        title: title,
      ),
    );
  }
}
