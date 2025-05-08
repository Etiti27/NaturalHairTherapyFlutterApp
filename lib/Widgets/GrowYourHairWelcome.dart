import 'package:flutter/material.dart';

import '../Constants.dart';
import '../Methods/secondaryNavigation.dart';

class WelcomeHair extends StatelessWidget {
  const WelcomeHair({
    super.key,
    required this.header,
    required this.subheader,
    required this.note,
    required this.nextButton,
    required this.nextButtonText,
    this.Section1,
    this.Section2,
    this.Section3,
    this.Section4,
  });

  final String header;
  final String subheader;
  final Widget note;
  final VoidCallback? nextButton;
  final Widget? Section1;
  final Widget? Section2;
  final Widget? Section3;
  final Widget? Section4;
  final String nextButtonText;

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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "<< Back",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  if (Section4 != null) Section4!,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor),
                    onPressed: nextButton,
                    child: Text(
                      nextButtonText,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  if (Section1 != null) Section1!,
                  if (Section2 != null) Section2!,
                  if (Section3 != null) Section3!
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
