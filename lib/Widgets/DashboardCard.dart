import 'package:flutter/material.dart';

import '../Constants.dart';

class DashboardCard extends StatefulWidget {
  Widget image;
  String title;
  Widget? icon;
  final VoidCallback OnTap;

  DashboardCard({
    super.key,
    required this.image,
    required this.title,
    required this.OnTap,
    this.icon,
  });

  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: widget.OnTap,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SizedBox(
          child: Card(
            color: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            // Shadow effect
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Image
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15.0),
                  ),
                  child: widget.image,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.icon != null) widget.icon!,
                      // Title
                      Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      // Subtitle

                      // Button Row
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
