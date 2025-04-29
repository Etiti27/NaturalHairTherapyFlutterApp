import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Ingredient/Methods/sliding.dart';

import '../../../../imports.dart';
import '../../Nutriton/Methods/listTile.dart';
import '../../Nutriton/classesInsideNutrition/NutritionMode.dart';

QuestionModal(BuildContext context) {
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
    backgroundColor: kPrimaryColor,
    builder: (BuildContext context) {
      return Card(
        color: kPrimaryColor,
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
                          print("i am $answer1");
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
                    text3: Column(
                      children: [
                        const Text(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                            "You can now close this and go to the next page (Building block)"),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Ingredient6.id);
                            },
                            child: const Text("Start Hair Needs Assessment"))
                      ],
                    ),
                  );
              }
            }

            return Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildStepContent(currentStep),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: currentStep == numberOfPages + 1 ||
                                  currentStep == 1
                              ? null
                              : () => setModalState(() {
                                    currentStep--;
                                  }),
                          child: const Text("<< prev"),
                        ),
                        currentStep == numberOfPages
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      showSlidingModal(context);
                                    },
                                    child: const Text("quick tip"),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  ElevatedButton(
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
                                    child: const Text("View Result"),
                                  ),
                                ],
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
                                  if (currentStep < numberOfPages + 1) {
                                    setModalState(() {
                                      currentStep++;
                                    });
                                  } else {
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text(
                                  currentStep < numberOfPages
                                      ? "next >>"
                                      : currentStep == numberOfPages
                                          ? "view result"
                                          : "close",
                                ),
                              )
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
