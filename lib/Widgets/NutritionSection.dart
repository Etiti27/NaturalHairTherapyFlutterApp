import 'package:flutter/material.dart';

import '../Constants.dart';
import '../Methods/secondaryNavigation.dart';

class NutritionSection extends StatelessWidget {
  const NutritionSection({
    super.key,
    required this.header,
    required this.subheader,
    required this.note,
    this.nextButton,
    this.Section1,
    this.Section2,
    this.Section3,
    this.prevButton,
  });

  final String header;
  final String subheader;
  final Widget note;
  final Widget? nextButton;
  final Widget? Section1;
  final Widget? Section2;
  final Widget? Section3;
  final Widget? prevButton;

  @override
  Widget build(BuildContext context) {
    double screenHeight =
        MediaQuery.of(context).size.height; // ✅ Get screen height
    double screenWidth =
        MediaQuery.of(context).size.width; // ✅ Get screen width
    bool isLandscape =
        screenWidth > screenHeight; // ✅ Detect if in landscape mode

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // ✅ Make entire screen scrollable in landscape
          child: Column(
            children: [
              SecondaryNavigation(
                title: header,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  subheader,
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ConstrainedBox(
                  // ✅ Make Card adjust its size dynamically
                  constraints: BoxConstraints(
                    maxHeight: isLandscape
                        ? screenHeight * 0.5
                        : screenHeight * 0.5, // ✅ Larger in landscape
                  ),
                  child: Card(
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: SingleChildScrollView(
                          child: note,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (Section1 != null) Section1!,
                  if (Section2 != null) Section2!,
                  if (Section3 != null) Section3!
                ],
              ),
              Row(
                children: [
                  if (prevButton != null) prevButton!,
                  if (nextButton != null) nextButton!,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
