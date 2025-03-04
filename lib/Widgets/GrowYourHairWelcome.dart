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
  });

  final String header;
  final String subheader;
  final Widget note;
  final VoidCallback? nextButton;
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
              SecondaryNavigation(title: header),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  subheader,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ConstrainedBox(
                  // ✅ Make Card adjust its size dynamically
                  constraints: BoxConstraints(
                    maxHeight: isLandscape
                        ? screenHeight * 0.5
                        : screenHeight * 0.55, // ✅ Larger in landscape
                  ),
                  child: Card(
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                                // ✅ Allow text to scroll if needed
                                child: note
                                // Text(
                                //   note,
                                //   textAlign: TextAlign.justify,
                                //   style: const TextStyle(
                                //     fontSize: 25,
                                //     color: Colors.white,
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),
                                ),
                          ),
                        ],
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
                      "<< prev",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor),
                    onPressed: nextButton,
                    child: Text(
                      nextButtonText,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                  height: 20), // ✅ Extra space to prevent bottom overflow
            ],
          ),
        ),
      ),
    );
  }
}
