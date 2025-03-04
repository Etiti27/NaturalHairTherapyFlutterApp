import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Constants.dart';

class Cards extends StatelessWidget {
  Cards({
    super.key,
    required this.onTap,
    required this.image,
    required this.title,
  });
  VoidCallback onTap;
  Widget image;
  String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                  child: image,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Title
                      Text(
                        title,
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
    );
  }
}
