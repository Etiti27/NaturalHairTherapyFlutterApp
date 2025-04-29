import 'package:natural_hair_therapist/Screens/UnderstandingNISH/sleep/Method/SleepQuickTip.dart';

import '../../../../imports.dart';
import '../../Nutriton/Methods/listTile.dart';
import '../../Nutriton/classesInsideNutrition/NutritionMode.dart';

SleepSelfcheckQuestion(BuildContext context) {
  int currentStep = 1;
  int numberOfPages = 5;

  String? selectedOption;
  final List<String> optionsQuestion = [
    'Always',
    "Sometimes",
    'Rarely',
  ];
  bool lastQuestionAnswered = false;

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
                    text1: 'I sleep at least 7 hours most nights.',
                    text3: listviewBuilder(
                      optionsQuestion: optionsQuestion,
                      answer: answer1,
                      onChanged: (String? v) {
                        setModalState(() {
                          answer1 = v;
                          print(answer1);
                          currentStep++;
                        });
                      },
                    ),
                  );
                case 2:
                  return NutritionModal(
                    text1: 'I feel well-rested when I wake up.',
                    text3: listviewBuilder(
                      optionsQuestion: optionsQuestion,
                      answer: answer2,
                      onChanged: (String? v) {
                        setModalState(() {
                          answer2 = v;
                          currentStep++;
                          print(answer2);
                        });
                      },
                    ),
                  );
                case 3:
                  return NutritionModal(
                    text1: 'I go to bed and wake up around the same time.',
                    text3: listviewBuilder(
                      optionsQuestion: optionsQuestion,
                      answer: answer3,
                      onChanged: (String? v) {
                        setModalState(() {
                          answer3 = v;
                          print(answer3);
                          currentStep++;
                        });
                      },
                    ),
                  );
                case 4:
                  return NutritionModal(
                    text1: "I avoid screens/bright light an hour before bed .",
                    text3: listviewBuilder(
                      optionsQuestion: optionsQuestion,
                      answer: answer4,
                      onChanged: (String? v) {
                        setModalState(() {
                          answer4 = v;
                          print(answer4);
                          currentStep++;
                        });
                      },
                    ),
                  );
                case 5:
                  return NutritionModal(
                    text1:
                        'I use silk or satin to protect my hair while sleeping.',
                    text3: listviewBuilder(
                      optionsQuestion: optionsQuestion,
                      answer: answer5,
                      onChanged: (String? v) {
                        setModalState(() {
                          answer5 = v;
                          lastQuestionAnswered = true;
                          print(answer5);
                        });
                      },
                    ),
                    text4: Text(
                      !lastQuestionAnswered ? "pls select option" : "",
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.red,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
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
                        if (currentStep == numberOfPages + 1)
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  SleepQuickTip(context);
                                },
                                child: const Text("Quick Tip"),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Close"),
                              ),
                            ],
                          ),

                        if (currentStep == numberOfPages)
                          ElevatedButton(
                            onPressed: lastQuestionAnswered
                                ? () {
                                    print("welcome");
                                    print(answer1);
                                    print(answer2);
                                    print(answer3);
                                    print(answer4);
                                    print(answer5);
                                    setModalState(() {
                                      currentStep++;
                                    });
                                  }
                                : null,
                            child: Text("View Result"),
                          )
                        // : ElevatedButton(
                        //     onPressed: () {
                        //       print({
                        //         answer1,
                        //         answer2,
                        //         answer3,
                        //         answer4,
                        //         answer5
                        //       });
                        //       if (currentStep < numberOfPages + 1) {
                        //         setModalState(() {
                        //           currentStep++;
                        //         });
                        //       } else {
                        //         Navigator.pop(context);
                        //       }
                        //     },
                        //     child: Text(
                        //       currentStep < numberOfPages
                        //           ? "next >>"
                        //           : currentStep == numberOfPages
                        //               ? "view result"
                        //               : "close",
                        //     ),
                        //   )
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
