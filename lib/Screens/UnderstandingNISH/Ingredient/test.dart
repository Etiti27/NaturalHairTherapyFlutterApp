import 'package:flutter/material.dart';

import '../../../Constants.dart';
import '../Nutriton/Methods/listTile.dart';
import '../Nutriton/classesInsideNutrition/NutritionMode.dart';

QuestionB(BuildContext context) {
  int currentStep = 1;
  int numberOfPages = 5;
  String? selectedOption;
  final List<String> optionsAnswer = [
    "Yes",
    "Sometimes",
    "Not sure",
  ];

  String? answer1;
  String? answer2;
  String? answer3;
  String? answer4;
  String? answer5;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent, // Make the background transparent
    builder: (BuildContext context) {
      return Card(
        color: Colors.white, // White background for the card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(30)), // Rounded top corners
        ),
        elevation: 10, // Add some shadow to make it pop
        child: StatefulBuilder(
          builder: (context, setModalState) {
            Widget _buildStepContent(int step) {
              switch (step) {
                case 1:
                  return NutritionModal(
                    text1:
                        'Do you usually check the ingredient list before buying a product?',
                    text3: listviewBuilder(
                      optionsQuestion: optionsAnswer,
                      answer: answer1,
                      onChanged: (String? v) {
                        setModalState(() {
                          answer1 = v;
                        });
                      },
                    ),
                  );
                case 2:
                  return NutritionModal(
                    text1:
                        'Are you aware of any ingredients that your hair doesn’t like?',
                    text3: listviewBuilder(
                      optionsQuestion: optionsAnswer,
                      answer: answer2,
                      onChanged: (String? v) {
                        setModalState(() {
                          answer2 = v;
                        });
                      },
                    ),
                  );
                case 3:
                  return NutritionModal(
                    text1:
                        'Do you know the difference between drying and moisturizing alcohols?',
                    text3: listviewBuilder(
                      optionsQuestion: optionsAnswer,
                      answer: answer3,
                      onChanged: (String? v) {
                        setModalState(() {
                          answer3 = v;
                        });
                      },
                    ),
                  );
                case 4:
                  return NutritionModal(
                    text1:
                        "Have you ever had a negative reaction to a product, but weren’t sure why?",
                    text3: listviewBuilder(
                      optionsQuestion: optionsAnswer,
                      answer: answer4,
                      onChanged: (String? v) {
                        setModalState(() {
                          answer4 = v;
                        });
                      },
                    ),
                  );
                case 5:
                  return NutritionModal(
                    text1:
                        'Do you choose products based on your hair need (e.g., moisture, protein)?',
                    text3: listviewBuilder(
                      optionsQuestion: optionsAnswer,
                      answer: answer5,
                      onChanged: (String? v) {
                        setModalState(() {
                          answer5 = v;
                        });
                      },
                    ),
                  );

                default:
                  return NutritionModal(
                    text1:
                        'You have successfully completed the Introduction section',
                    text2:
                        'You can now close this and go to the next page (Building block)',
                  );
              }
            }

            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Step Progress Indicator
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(numberOfPages, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: currentStep == index + 1
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          );
                        }),
                      ),
                    ),
                    _buildStepContent(currentStep),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: currentStep == 1
                              ? null
                              : () => setModalState(() {
                                    currentStep--;
                                  }),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text("<< prev"),
                        ),
                        currentStep == numberOfPages
                            ? ElevatedButton(
                                onPressed: () {
                                  print({
                                    answer1,
                                    answer2,
                                    answer3,
                                    answer4,
                                    answer5
                                  });
                                  setModalState(() {
                                    currentStep++;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.blueAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Text("View Result"),
                              )
                            : ElevatedButton(
                                onPressed: () {
                                  print({
                                    answer1,
                                    answer2,
                                    answer3,
                                    answer4,
                                    answer5
                                  });
                                  if (currentStep < numberOfPages) {
                                    setModalState(() {
                                      currentStep++;
                                    });
                                  } else {
                                    Navigator.pop(context);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.blueAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  currentStep < numberOfPages
                                      ? "Next >>"
                                      : currentStep == numberOfPages
                                          ? "View Result"
                                          : "Close",
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
