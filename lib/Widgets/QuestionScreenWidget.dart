import 'package:flutter/material.dart';

import '../Constants.dart';
import '../Methods/BackgroundImage.dart';

class questionScreens extends StatelessWidget {
  const questionScreens({
    super.key,
    required this.questionnaireAnswer,
    // this.image,
    required this.text,
    required this.listOfAnswer,
    required this.OnChange,
    this.nextButtonAppearance,
    this.prevButtonAppearance,
    // required ProviderClass questionnaire,
  });

  // final Image image;
  final String text;
  final String? questionnaireAnswer;
  final List<String> listOfAnswer;
  final ValueChanged<String?> OnChange;

  final Widget? nextButtonAppearance;
  final ElevatedButton? prevButtonAppearance;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: double.infinity,
      decoration: BackgroundImage(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(
              //   height: 20,
              // ),
              Card(
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                // Shadow effect

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // Image
                    // ClipRRect(
                    //     borderRadius: const BorderRadius.vertical(
                    //       top: Radius.circular(15.0),
                    //     ),
                    //     child: image),
                    // const SizedBox(
                    //   height: 30,
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            text,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          DropdownButton<String>(
                            value: questionnaireAnswer,
                            hint: const Text(
                              "Select an option",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            items: listOfAnswer
                                .map((option) => DropdownMenuItem(
                                      value: option,
                                      child: Center(
                                        child: Text(
                                          option,
                                          style: const TextStyle(
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                            onChanged: OnChange,
                            isExpanded: true,
                            icon: const Icon(
                              Icons
                                  .arrow_drop_down, // Adjust the dropdown arrow icon
                              color: Colors.white, // Set the color of the arrow
                              size: 24, // Adjust the size of the arrow
                            ),
                            dropdownColor:
                                kPrimaryColor, // Set dropdown menu color to match the card
                            style: const TextStyle(
                              color: Colors
                                  .white, // Set the text color of the selected item
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            underline: Container(
                              height: 2,
                              color: Colors
                                  .white, // Add an underline for styling (optional)
                            ),
                          ),
                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (prevButtonAppearance != null)
                                prevButtonAppearance!,
                              if (nextButtonAppearance != null)
                                nextButtonAppearance!,
                            ],
                          ),

                          // Subtitle

                          // Button Row
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
