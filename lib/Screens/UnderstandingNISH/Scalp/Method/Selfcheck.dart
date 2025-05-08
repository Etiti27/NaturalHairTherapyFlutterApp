import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Scalp/Method/quicktip.dart';

import '../../../../Methods/AiHttpMethod.dart';
import '../../../../imports.dart';
import '../../Nutriton/Methods/listTile.dart';
import '../../Nutriton/classesInsideNutrition/NutritionMode.dart';

selfcheckQuestion(BuildContext context) {
  int currentStep = 1;
  int numberOfPages = 5;
  final OpenAIService openAIService = OpenAIService();
  String? data;
  bool isNew = true;

  String? selectedOption;
  final List<String> optionsQuestion = [
    'Yes',
    "No",
    'Sometimes',
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
                    text1: 'I massage my scalp regularly.',
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
                    text1: 'My scalp ever feels itchy, tight, or flaky.',
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
                    text1: 'I use heavy oils or butters on my scalp.',
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
                    text1: "I often wear tight or tension-heavy styles.",
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
                  return isNew
                      ? NutritionModal(
                          text1:
                              'I notice breakage or tenderness at the roots.',
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
                        )
                      : NutritionModal(
                          text1: "Please Wait.",
                          text2: "Analyzing Your data ...",
                          text3: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );

                default:
                  return NutritionModal(
                    text3: Column(
                      children: [
                        const Text(
                          "Result",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Divider(
                          color: Colors.white,
                          thickness: 5.0,
                        ),
                        Text(
                          data!,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    // text3: ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pop(context);
                    //   },
                    //   child: const Text("close"),
                    // ),
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
                                  quicktip(context);
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
                                ? () async {
                                    setModalState(() {
                                      isNew = false;
                                    });
                                    String input = """
                              I massage my scalp regularly: $answer1,
                              My scalp ever feels itchy, tight, or flaky: $answer2,
                              I use heavy oils or butters on my scalp: $answer3,
                              I often wear tight or tension-heavy styles: $answer4,
                              I notice breakage or tenderness at the roots: $answer5.""";

                                    try {
                                      String resp =
                                          await openAIService.generateResponse(
                                              input,
                                              "Generate a personalized summary (max 25 words) based on a hair assessment using the NISH framework: Nutrition, Ingredients, Scalp Care, Sleep Management, Stress Management, and Hair Maintenance.The tone should be warm, empowering, and informative.");
                                      print(resp);
                                      setModalState(() {
                                        data = resp;
                                        currentStep++;
                                      });
                                    } catch (e) {
                                      print(e.toString());
                                    }
                                    print("welcome");
                                    print(answer1);
                                    print(answer2);
                                    print(answer3);
                                    print(answer4);
                                    print(answer5);
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
