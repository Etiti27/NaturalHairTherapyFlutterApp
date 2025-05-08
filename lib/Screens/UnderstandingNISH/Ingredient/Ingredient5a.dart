import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../../../Constants.dart';
import '../../../Methods/AiHttpMethod.dart';
import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';
import '../Intro.dart';
import '../Nutriton/Methods/listTile.dart';
import '../Nutriton/classesInsideNutrition/NutritionMode.dart';
import 'Ingredient6.dart';
import 'Methods/IngredientCard.dart';
import 'Methods/sliding.dart';

class Ingredient5a extends StatefulWidget {
  const Ingredient5a({super.key});
  static const String id = "ingredient5a";

  @override
  State<Ingredient5a> createState() => _Ingredient5aState();
}

class _Ingredient5aState extends State<Ingredient5a> {
  bool isData = false;
  bool isNew = true;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    bool isLandscape = screenWidth > screenHeight;

    int totalSteps = 3; // total number of flip cards
    int currentStep = 1;
    return Scaffold(
      appBar: AppBarWidget(),
      body: NutritionModal(
        text1: "",
        text3: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: StatefulBuilder(
                builder: (context, setState) {
                  Widget buildFlipCard(int step) {
                    switch (step) {
                      case 1:
                        return FlipCard(
                          direction: FlipDirection.HORIZONTAL,
                          speed: 500,
                          front: buildFrontCardB(
                            title: "Individual Response Matters",
                          ),
                          back: buildBackCardB(
                            description:
                                """Hair doesn’t always respond to ingredients the way it does on paper. For example, glycerin is known as a humectant (it attracts moisture), but in dry climates, it might actually pull moisture out of your hair. 
                                
                      Your location, hair condition, and routine all affect how an ingredient performs.

Just because it works for someone else doesn’t mean it will work for you. Learn how your own hair responds, Listen to your hair!""",
                          ),
                        );

                      case 2:
                        return FlipCard(
                          direction: FlipDirection.HORIZONTAL,
                          speed: 500,
                          front: buildFrontCardB(
                            title: "Focus on Hair Needs, Not Hair Types",
                          ),
                          back: buildBackCardB(
                            description:
                                """Most products are marketed toward curl types, but that can be misleading. A 3B and a 4C curl may both be dry, but require different levels of hydration or protein.

NHT philosophy:
	“Don’t look at the hair type, look at the hair NEED.”

Common Hair Needs:
	•	Moisture Condition
	•	Strength
	•	Scalp soothing
	•	Protein repair
	•	Protection from heat or manipulation""",
                          ),
                        );

                      case 3:
                        return FlipCard(
                          direction: FlipDirection.HORIZONTAL,
                          speed: 500,
                          front: buildFrontCardB(
                            title: "Breaking Ingredient Myths",
                          ),
                          back: buildBackCardB(
                            description: """🧴 Silicones
	•	✅ Can help with heat protection and reduce frizz.
	•	⚠️ Can cause buildup over time if not removed properly.
	•	✔ Use a clarifying shampoo occasionally to remove them.

Sulfates
	•	⚠️ Some are harsh and can strip natural oils (like SLS).
	•	✅ Others are milder (like sodium cocoyl isethionate in some cleansers).
	•	✔ Use when deep cleansing is needed (e.g., after using heavy oils or butters)

Alcohols
	•	⚠️ Short-chain alcohols like isopropyl alcohol can dry the hair.
	•	✅ Fatty alcohols like cetyl alcohol or stearyl alcohol actually help with moisture and slip.""",
                          ),
                        );
                      default:
                        return FlipCard(
                            direction: FlipDirection.HORIZONTAL,
                            speed: 500,
                            front: buildFrontCardB(
                              title: "How to Read a Label",
                            ),
                            back: buildBackCardB(
                              description: """What to check:
	•	The first 5 ingredients make up the bulk of the product.
	•	Learn the difference between moisturizers, proteins, emollients, and humectants.
	•	Avoid ingredients that consistently dry your hair out—or at least balance them with hydrating ingredients.

NHT Tip: The right product for you is the one with the right ingredients for your current hair need.""",
                            ));
                    }
                  }

                  return SingleChildScrollView(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          opacity: 0.2,
                          image: AssetImage('assets/images/nii.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: isLandscape
                                    ? screenHeight * 0.8
                                    : screenHeight * 0.5,
                                minWidth: screenWidth * 0.8,
                              ),
                              child: buildFlipCard(currentStep),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: currentStep > 1
                                    ? () => setState(() => currentStep--)
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: kPrimaryColor,
                                ),
                                child: const Text("<< Prev"),
                              ),
                              if (currentStep == totalSteps + 1)
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, IntroNISH.id);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: kPrimaryColor,
                                  ),
                                  child: const Text("home"),
                                ),
                              ElevatedButton(
                                onPressed: currentStep < totalSteps + 1
                                    ? () => setState(() => currentStep++)
                                    : () => _QuestionModal(context),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: kPrimaryColor,
                                ),
                                child: Text(currentStep < totalSteps + 1
                                    ? "Next >>"
                                    : "Self-Check"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }

  _QuestionModal(BuildContext context) {
    final OpenAIService openAIService = OpenAIService();

    int currentStep = 1;
    int numberOfPages = 5;
    String? data;
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
    bool shouldMove1 = false;
    bool shouldMove2 = false;
    bool shouldMove3 = false;
    bool shouldMove4 = false;
    bool shouldMove5 = false;
    bool lastQuestionAnswered = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: kPrimaryColor,
      builder: (BuildContext context) {
        return Card(
          color: kPrimaryColor,
          child: StatefulBuilder(
            builder: (context, setModalState) {
              Widget buildStepContent(int step) {
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
                            currentStep++;
                            shouldMove1 = true;

                            print("i am just $answer1");
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
                            currentStep++;
                            print(answer2);
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
                            currentStep++;
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
                            currentStep++;
                          });
                        },
                      ),
                    );
                  case 5:
                    return isNew
                        ? NutritionModal(
                            text1:
                                'Do you choose products based on your hair need (e.g., moisture, protein)?',
                            text3: listviewBuilder(
                              optionsQuestion: optionsAnswer,
                              answer: answer5,
                              onChanged: (String? v) {
                                setModalState(() {
                                  answer5 = v;
                                  lastQuestionAnswered = true;
                                  // currentStep++;
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
                            text1: "Please Wait",
                            text3: const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                            text2: "Analyzing Your data...");

                  default:
                    return NutritionModal(
                        text1: 'Your Self Check Result',
                        text2: data,
                        text3: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Ingredient6.id);
                          },
                          child: const Text("Start Hair Needs Assessment"),
                        )
                        // Column(
                        //   children: [
                        //     const Text(
                        //         style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 20.0,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //         "data"),
                        //     const SizedBox(
                        //       height: 20.0,
                        //     ),
                        //     ElevatedButton(
                        //       onPressed: () {
                        //         Navigator.pushNamed(context, Ingredient6.id);
                        //       },
                        //       child: const Text("Start Hair Needs Assessment"),
                        //     )
                        //   ],
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
                      buildStepContent(currentStep),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                    Navigator.pop(context);
                                  },
                                  child: const Text("close"),
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
                                      String input =
                                          """Do you usually check the ingredient list before buying a product?: $answer1.
                                        Are you aware of any ingredients that your hair doesn’t like?: $answer2.
                                        Do you know the difference between drying and moisturizing alcohols?: $answer3.
                                        Have you ever had a negative reaction to a product, but weren’t sure why?: $answer4.
                                        Do you choose products based on your hair need (e.g., moisture, protein)?: $answer5.""";
                                      try {
                                        String resp = await openAIService
                                            .generateResponse(input,
                                                "Generate a personalized summary (max 25 words) based on a hair assessment using the NISH framework: Nutrition, Ingredients, Scalp Care, Sleep Management, Stress Management, and Hair Maintenance.The tone should be warm, empowering, and informative.");
                                        print(resp);
                                        setModalState(() {
                                          data = resp;
                                          isData = true;
                                          isNew = true;
                                          currentStep++;
                                        });
                                      } catch (e) {
                                        print(e.toString());
                                      }
                                      print({
                                        answer1,
                                        answer2,
                                        answer3,
                                        answer4,
                                        answer5
                                      });
                                    }
                                  : null,
                              child: const Text("show result"),
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
}
