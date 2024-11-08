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
  Image image;
  String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SizedBox(
          height: 130,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 8, // Shadow effect
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
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
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
