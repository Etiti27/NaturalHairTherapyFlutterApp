import '../../../../imports.dart';
import '../../Nutriton/Methods/listTile.dart';
import '../../Nutriton/classesInsideNutrition/NutritionMode.dart';

QuestionB(BuildContext context) {
  int currentStep = 1;
  int numberOfPages = 6;
  String? selectedOption;
  final List<String> optionsAnswer1 = [
    "Very dry and rough",
    "Dry but soft",
    "Balanced",
    "A bit stiff or brittle",
    "Strong but not very flexible",
  ];
  final List<String> optionsAnswer2 = [
    "It snaps easily without stretching",
    "It stretches but doesn’t return",
    "It stretches and returns (elastic)",
    "It doesn’t stretch at all",
    "I’m not sure"
  ];
  final List<String> optionsAnswer3 = [
    "Yes, lots of breakage",
    "Occasional breakage",
    "Rarely",
    "Only when detangling",
    "Not sure",
  ];
  final List<String> optionsAnswer4 = [
    "Soaks it up but dries quickly",
    "Becomes soft and bouncy",
    "Gets limp or mushy",
    "Doesn’t absorb well",
    "I avoid moisture—it causes frizz",
  ];
  final List<String> optionsAnswer5 = [
    'Yes, within the last 1–2 weeks',
    'A few times this month',
    'Not for a while',
    'I avoid protein',
    'Not sure',
  ];
  final List<String> optionsAnswer6 = [
    'Heat styling or frequent manipulation',
    'Mostly protective styles',
    'Wash and go or low manipulation',
    'I wear wigs/weaves often',
    'My routine changes a lot',
  ];

  String? answer1;
  String? answer2;
  String? answer3;
  String? answer4;
  String? answer5;
  String? answer6;

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
                        'How does your hair feel when dry (not freshly moisturized)?',
                    text3: listviewBuilder(
                      optionsQuestion: optionsAnswer1,
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
                        'How does your hair behave when you stretch a strand gently?',
                    text3: listviewBuilder(
                      optionsQuestion: optionsAnswer2,
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
                        'Are you experiencing breakage (small hairs in the sink, on your clothes, or hands)?',
                    text3: listviewBuilder(
                      optionsQuestion: optionsAnswer3,
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
                        "How does your hair respond to water or moisture-based products?",
                    text3: listviewBuilder(
                      optionsQuestion: optionsAnswer4,
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
                        'Have you used protein treatments or protein-rich products recently?',
                    text3: listviewBuilder(
                      optionsQuestion: optionsAnswer5,
                      answer: answer5,
                      onChanged: (String? v) {
                        setModalState(() {
                          answer5 = v;
                        });
                      },
                    ),
                  );
                case 6:
                  return NutritionModal(
                    text1: 'What is your current styling routine like?',
                    text3: listviewBuilder(
                      optionsQuestion: optionsAnswer6,
                      answer: answer6,
                      onChanged: (String? v) {
                        setModalState(() {
                          answer6 = v;
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
                                child: Text("View Result"),
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
