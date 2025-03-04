import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Methods/PostgreSQL.dart';
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
  final DatabaseService postgre = DatabaseService(); // ✅ PostgreSQL Instance

  String responseText = "Loading...";
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    connectDatabase(); // ✅ Ensure PostgreSQL connects on init
  }

  // ✅ Ensure PostgreSQL is connected before using it
  Future<void> connectDatabase() async {
    await postgre.ensureConnected();
  }

  // ✅ Fetch AI-generated response
  Future<void> fetchResponse(String userInput) async {
    setState(() {
      isLoading = true;
      responseText = "Loading...";
    });

    try {
      String response = await openAIService.generateResponse(
          userInput, "Summarize in not more than 100 words");
      setState(() {
        responseText = response;
      });
    } catch (e) {
      setState(() {
        responseText = "Error: Failed to fetch response.";
        isLoading = true;
      });
    }
  }

  // ✅ Update PostgreSQL Response
  Future<void> updateResponse(String email, String response) async {
    await postgre.ensureConnected(); // ✅ Ensure connection before query
    try {
      await postgre.updateResponse(email, response);
      setState(() {
        isLoading = false;
      });
      print("✅ Database updated for: $email");
    } catch (e) {
      print("❌ Database update failed: $e");
    }
  }

  // ✅ Send Email
  Future<void> sendEmails(String? recepientEmail, String text) async {
    if (recepientEmail == null || recepientEmail.isEmpty) return;
    EmailSend email = EmailSend(
      emailSubject: 'Hair Report',
      emailText: text,
      receipientEmail: recepientEmail,
    );
    await email.sendEmailed();
  }

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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20), // Add spacing
                    LinearProgressIndicator(
                      value: widget.questionnaire.getProgress(),
                      color: kPrimaryColor,
                      minHeight: 5.0,
                    ),
                    const SizedBox(height: 20),

                    // ✅ Question Screen
                    questionScreens(
                      questionnaireAnswer: widget.questionnairAnswer,
                      text:
                          "${_questions["question${widget.questionnaire.getCurrentPage()}"]}",
                      listOfAnswer: widget.list,
                      OnChange: widget.OnChange,

                      // ✅ Previous Button
                      prevButtonAppearance: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {
                          if (widget.questionnaire.getCurrentPage() > 1) {
                            widget.questionnaire.updateProgressBck(
                                widget.questionnaire.getTotalPage());
                          }
                          Navigator.pop(context);
                        },
                        child: const Text("<< prev",
                            style: TextStyle(color: kPrimaryColor)),
                      ),

                      // ✅ Next/Finish Button
                      nextButtonAppearance: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () async {
                          if (widget.questionnaire.getCurrentPage() ==
                              widget.questionnaire.getTotalPage()) {
                            // ✅ Reset Progress on Completion
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

                            // ✅ Create Input for AI
                            String input =
                                "I ${widget.questionnaire.getHairGrowthAnswer1()} foods high in protein (like beans, fish, eggs) in my diet. "
                                "I take ${widget.questionnaire.getHairGrowthAnswer2()} supplements (e.g., vitamins, minerals) for hair health. "
                                "I look for ${widget.questionnaire.getHairGrowthAnswer3()} in hair products. "
                                "I am aware that ${widget.questionnaire.getHairGrowthAnswer4()} might harm my hair’s health. "
                                "I ${widget.questionnaire.getHairGrowthAnswer5()} massage my scalp. "
                                "I sleep ${widget.questionnaire.getHairGrowthAnswer6()} hours per night. "
                                "I ${widget.questionnaire.getHairGrowthAnswer7()} use a silk scarf or pillowcase. "
                                "I describe my stress level as ${widget.questionnaire.getHairGrowthAnswer8()}. "
                                "I ${widget.questionnaire.getHairGrowthAnswer9()} practice stress management (e.g., meditation, exercise, journaling).";

                            // ✅ Fetch AI Response
                            await fetchResponse(input);

                            // ✅ Update Database & Send Email

                            await sendEmails(
                              questionnaire.getEmail(),
                              "<h2>Hello ${questionnaire.getCurrentUsername()},</h2> <p>$responseText</p>",
                            );
                            await updateResponse(
                                questionnaire.getEmail()!, responseText);

                            // ✅ Navigate After Async Tasks Are Done

                            Navigator.pushNamed(
                              context,
                              ResultScreen.id,
                              arguments: {"responseText": responseText},
                            );
                          } else {
                            widget.questionnaire.updateProgress(
                                widget.questionnaire.getTotalPage());
                            Navigator.pushNamed(context,
                                "Question${widget.questionnaire.getCurrentPage()}");
                          }
                        },
                        child: Text(
                          widget.questionnaire.getCurrentPage() ==
                                  widget.questionnaire.getTotalPage()
                              ? "Finish"
                              : "Next >>",
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      ),
                    ),

                    if (widget.feedback != null) widget.feedback!,
                  ],
                ),
              ),
            ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
