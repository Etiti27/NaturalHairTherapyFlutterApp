import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Constants.dart';
import '../Methods/AiHttpMethod.dart';
import '../Methods/EmailSend.dart';
import '../Methods/ProviderPackage.dart';
import '../Methods/QuestionBank.dart';
import '../Screens/Result.dart';
import 'AppBarWidget.dart';
import 'BottomWidget.dart';
import 'QuestionScreenWidget.dart';

class QuestionsDynamics extends StatefulWidget {
  QuestionsDynamics({
    super.key,
    required this.questionnaire,
    // required this.text,
    required this.list,
    required this.questionnairAnswer,
    required this.OnChange,
    this.feedback,
  });

  final ProviderClass questionnaire;
  final Widget? feedback;
  final List<String> list;
  final String? questionnairAnswer;
  final ValueChanged<String?> OnChange;

  @override
  State<QuestionsDynamics> createState() => _QuestionsDynamicsState();
}

class _QuestionsDynamicsState extends State<QuestionsDynamics> {
  final Map _questions = QuestionBank().getQuestion();

  final Map _answers = QuestionBank().getAnswer();

  final OpenAIService openAIService = OpenAIService();

  String responseText = "loading";
  bool isLoading = false;

  Future<void> fetchResponse(String userInput) async {
    setState(() {
      isLoading = true;
      responseText = "Loading..."; // Show loading state
    });

    try {
      String response =
          await openAIService.generateResponse(userInput, "write 100 words");
      setState(() {
        responseText = response;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        responseText = "Error: Failed to fetch response.";
        isLoading = true;
      });
    }
  }

  Future<void> sendEmails(String? recepientEmail, String text) async {
    EmailSend email = EmailSend(
      emailSubject: 'Hair Report',
      emailText: text,
      receipientEmail: recepientEmail!,
    );
    await email.sendEmailed();
  }

  // "I ${questionnaire.getHairGrowthAnswer1()} foods high in protein (like beans, fish, eggs) in your diet"
  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    return Scaffold(
      appBar: AppBarWidget(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: kPrimaryColor,
              ),
            )
          : SingleChildScrollView(
              child: Container(
                width: double.infinity, // Ensures the Column takes full width
                padding: const EdgeInsets.symmetric(
                    horizontal: 16), // Optional padding
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Centers vertically
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Centers horizontally
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.2), // Push content downward

                    LinearProgressIndicator(
                      value: widget.questionnaire.getProgress(),
                      color: kPrimaryColor,
                      minHeight: 5.0,
                    ),

                    questionScreens(
                      questionnaireAnswer: widget.questionnairAnswer,
                      text:
                          "${_questions["question${widget.questionnaire.getCurrentPage()}"]}",
                      listOfAnswer: widget.list,
                      OnChange: widget.OnChange,
                      prevButtonAppearance: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {
                          debugPrint("screen 1 prev button pressed");
                          if (widget.questionnaire.getCurrentPage() > 1) {
                            widget.questionnaire.updateProgressBck(
                                widget.questionnaire.getTotalPage());
                          }
                          Navigator.pop(context);
                        },
                        child: const Text("<< prev",
                            style: TextStyle(color: kPrimaryColor)),
                      ),
                      nextButtonAppearance: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () async {
                          if (widget.questionnaire.getCurrentPage() ==
                              widget.questionnaire.getTotalPage()) {
                            widget.questionnaire.resetProgress();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: kPrimaryColor,
                                content: Text(
                                  "You've completed all questions!",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );

                            String input =
                                "I ${widget.questionnaire.getHairGrowthAnswer1()} foods high in protein (like beans, fish, eggs) in your diet"
                                "with ${widget.questionnaire.getHairGrowthAnswer2()} supplements (e.g., vitamins, minerals) specifically for hair or general health"
                                "i look out for ${widget.questionnaire.getHairGrowthAnswer3()} in my hair product"
                                "I am aware that ${widget.questionnaire.getHairGrowthAnswer4()} ingredients might harm my hair's health or cause dryness"
                                "I ${widget.questionnaire.getHairGrowthAnswer5()} massage my scalp or scalp-specific treatment"
                                "I usually sleep ${widget.questionnaire.getHairGrowthAnswer6()} per night and"
                                "${widget.questionnaire.getHairGrowthAnswer7()} protect my hair with a silk scarf or pillowcase"
                                "i can describe my stress level as being ${widget.questionnaire.getHairGrowthAnswer8()} and"
                                "${widget.questionnaire.getHairGrowthAnswer9()} practice stress management like meditation, exercise or journaling";
                            await fetchResponse(input);
                            questionnaire.updateResponse(responseText);
                            sendEmails(questionnaire.getEmail(),
                                "<h2>Hello ${questionnaire.getCurrentUsername()},</h2> <p>$responseText</p>");

                            Navigator.pushNamed(
                              context,
                              ChatScreen.id,
                              arguments: {"responseText": responseText},
                            );
                          } else if (widget.questionnaire.getCurrentPage() <
                              widget.questionnaire.getTotalPage()) {
                            widget.questionnaire.updateProgress(
                                widget.questionnaire.getTotalPage());
                            Navigator.pushNamed(context,
                                "Question${widget.questionnaire.getCurrentPage()}");
                          }
                        },
                        child: Text(
                          widget.questionnaire.getCurrentPage() ==
                                  widget.questionnaire.getTotalPage()
                              ? "finish"
                              : "next >>",
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      ),
                    ),
                    // Text(responseText!),

                    if (widget.feedback != null) widget.feedback!,

                    SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.3), // Add spacing at bottom
                  ],
                ),
              ),
            ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
