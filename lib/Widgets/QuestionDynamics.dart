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
    required this.feedback,
    required this.isValue,
  });

  final ProviderClass questionnaire;
  final String feedback;
  final List<String> list;
  final String? questionnairAnswer;
  final ValueChanged<String?> OnChange;
  final bool isValue;

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
  List<String> response = [];

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
  Future<void> fetchResponse(List<String> userInput) async {
    setState(() {
      isLoading = true;
      responseText = "Loading...";
    });

    try {
      for (int i = 0; i < userInput.length; i++) {
        String resp = await openAIService.generateResponse(userInput[i],
            "Generate a personalized summary (max 25 words) based on a hair assessment using the NISH framework: Nutrition, Ingredients, Scalp Care, Sleep Management, Stress Management, and Hair Maintenance.The tone should be warm, empowering, and informative.");

        setState(() {
          responseText = resp;
          response.add(resp);
        });
      }
      print(response[0]);
      print(response[1]);
      print(response[2]);
      print(response[3]);
      print(response[4]);
      print(response[5]);
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
      emailSubject: 'Your Personalized Hair Assessment Results 🎉',
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    backgroundColor: kPrimaryColor,
                    semanticsLabel:
                        "Please wait while we analyze your concerns...",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Please wait while we analyze your concerns...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      // color: kPrimaryColor,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            )
          : Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      QuestionScreens(
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
                        nextButtonAppearance: !widget.isValue
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey),
                                onPressed: () {},
                                child: Text("Next >>"),
                              )
                            : ElevatedButton(
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
                                        "I do experience issues like dandruff or an itchy scalp ${widget.questionnaire.getHairGrowthAnswer6()}"
                                        "I sleep ${widget.questionnaire.getHairGrowthAnswer7()} hours per night. "
                                        "I ${widget.questionnaire.getHairGrowthAnswer8()} use a silk scarf or pillowcase. "
                                        "I describe my stress level as ${widget.questionnaire.getHairGrowthAnswer9()}. "
                                        "I ${widget.questionnaire.getHairGrowthAnswer10()} practice stress management (e.g., meditation, exercise, journaling).";

                                    String nutrition =
                                        "Nutrition (The Building Blocks of Hair Growth)"
                                        "Current Habit: You ${widget.questionnaire.getHairGrowthAnswer1()} consume protein-rich foods and ${widget.questionnaire.getHairGrowthAnswer2()} take supplements for hair health."
                                        "What This Means: Protein is a key building block for hair. While you’re including some protein in your diet, increasing your intake of foods rich in biotin, iron, and omega-3 fatty acids can further support strong, resilient hair."
                                        "Tip: Try incorporating more lean meats, eggs, nuts, or legumes into your meals for better hair strength.";

                                    String ingredient =
                                        "Ingredients (Choosing What Works for Your Hair)"
                                        "Current Habit: You are aware of harmful ingredients like ${widget.questionnaire.getHairGrowthAnswer4()}, and you prefer ${widget.questionnaire.getHairGrowthAnswer3()} in your hair products."
                                        "What This Means: Awareness of ingredients is a great step! ${widget.questionnaire.getHairGrowthAnswer3()} is an excellent moisturizer, but be mindful of how it interacts with your hair. Some ingredients may work differently depending on your hair’s moisture needs and the environment."
                                        "Tip: Continue reading ingredient labels, and consider adding humectants (like glycerin or honey) if you need extra hydration or lightweight oils if your hair feels heavy with butters.";

                                    String scalp =
                                        "Scalp Care (The Feeding Soil of Hair)"
                                        "Current Habit: You ${widget.questionnaire.getHairGrowthAnswer5()} massage your scalp and ${widget.questionnaire.getHairGrowthAnswer6()} have dandruff or itchy scalp issues."
                                        "What This Means: A healthy scalp is essential for hair growth! Massaging your scalp improves blood flow and brings nutrients to your hair follicles."
                                        "Tip: Try massaging your scalp at least 3-4 times per week with a few drops of light oil (like rosemary or peppermint oil) to further stimulate hair growth.";

                                    String sleep =
                                        "Sleep Management (The Restorative Process for Hair)"
                                        "Current Habit: you sleep ${widget.questionnaire.getHairGrowthAnswer7()} hours per night."
                                        "Why It Matters: While you sleep, your body releases melatonin, a hormone that supports hair growth. Poor sleep can contribute to weakened hair follicles and stress-related hair shedding."
                                        "Tip: Try to aim for 7-9 hours of quality sleep each night and establish a calming nighttime routine. Consider reducing screen time before bed and incorporating relaxation techniques like deep breathing.";

                                    String stress =
                                        "Stress Management (Balancing Your Body for Healthy Hair)"
                                        "Current Habit: You practice stress management ${widget.questionnaire.getHairGrowthAnswer10()}, stress levels significantly impact hair growth."
                                        "What This Means: If you experience frequent stress, it can lead to increased hair shedding and even scalp inflammation."
                                        "Tip: If you notice stress affecting your body, consider adding relaxation techniques like meditation, yoga, or short walks into your routine.";

                                    String hairMain =
                                        "Hair Maintenance (Protecting the Hair You Have)"
                                        "Current Habit: You ${widget.questionnaire.getHairGrowthAnswer8()} use a silk scarf or pillowcase to protect your hair."
                                        "What This Means: Using silk or satin materials helps reduce friction and moisture loss, preventing breakage."
                                        "Tip: Consider wearing a satin bonnet every night or switching to a 100% silk pillowcase for extra protection. If your hair is dry, try a light mist of water or leave-in conditioner before wrapping it at night.";

                                    String input2 =
                                        "Thank you for completing your Hair Needs Assessment! Understanding your current hair habits is the first step toward healthier, stronger hair.This personalized report gives you an overview of your current routine and offers recommendations based on the NISH framework—Nutrition, Ingredients, Scalp Care, Sleep, Stress Management, and Hair Maintenance."
                                        "We’ve broken down your results into key areas, highlighting your strengths and suggesting areas for improvement. Let’s take a look at your hair journey so far!"
                                        "Your Hair Assessment Results \n"
                                        "<p>1. Nutrition (The Building Blocks of Hair Growth)"
                                        "Current Habit: You ${widget.questionnaire.getHairGrowthAnswer1()} consume protein-rich foods and ${widget.questionnaire.getHairGrowthAnswer2()} take supplements for hair health."
                                        "What This Means: Protein is a key building block for hair. While you’re including some protein in your diet, increasing your intake of foods rich in biotin, iron, and omega-3 fatty acids can further support strong, resilient hair."
                                        "Tip: Try incorporating more lean meats, eggs, nuts, or legumes into your meals for better hair strength.</p>"
                                        "<p>2. Ingredients (Choosing What Works for Your Hair)"
                                        "Current Habit: You are aware of harmful ingredients like ${widget.questionnaire.getHairGrowthAnswer4()}, and you prefer ${widget.questionnaire.getHairGrowthAnswer3()} in your hair products."
                                        "What This Means: Awareness of ingredients is a great step! ${widget.questionnaire.getHairGrowthAnswer3()} is an excellent moisturizer, but be mindful of how it interacts with your hair. Some ingredients may work differently depending on your hair’s moisture needs and the environment."
                                        "Tip: Continue reading ingredient labels, and consider adding humectants (like glycerin or honey) if you need extra hydration or lightweight oils if your hair feels heavy with butters.</p>"
                                        "<p>3.Scalp Care (The Feeding Soil of Hair)"
                                        "Current Habit: You ${widget.questionnaire.getHairGrowthAnswer5()} massage your scalp and ${widget.questionnaire.getHairGrowthAnswer6()} have dandruff or itchy scalp issues."
                                        "What This Means: A healthy scalp is essential for hair growth! Massaging your scalp improves blood flow and brings nutrients to your hair follicles."
                                        "Tip: Try massaging your scalp at least 3-4 times per week with a few drops of light oil (like rosemary or peppermint oil) to further stimulate hair growth.</p>"
                                        "<p>4.Sleep Management (The Restorative Process for Hair)"
                                        "Current Habit: you sleep ${widget.questionnaire.getHairGrowthAnswer7()} hours per night."
                                        "Why It Matters: While you sleep, your body releases melatonin, a hormone that supports hair growth. Poor sleep can contribute to weakened hair follicles and stress-related hair shedding."
                                        "Tip: Try to aim for 7-9 hours of quality sleep each night and establish a calming nighttime routine. Consider reducing screen time before bed and incorporating relaxation techniques like deep breathing.</p>"
                                        "<p>5.Stress Management (Balancing Your Body for Healthy Hair)"
                                        "Current Habit: You practice stress management ${widget.questionnaire.getHairGrowthAnswer10()}, stress levels significantly impact hair growth."
                                        "What This Means: If you experience frequent stress, it can lead to increased hair shedding and even scalp inflammation."
                                        "Tip: If you notice stress affecting your body, consider adding relaxation techniques like meditation, yoga, or short walks into your routine.</p>"
                                        "<p>6. Hair Maintenance (Protecting the Hair You Have)"
                                        "Current Habit: You ${widget.questionnaire.getHairGrowthAnswer8()} use a silk scarf or pillowcase to protect your hair."
                                        "What This Means: Using silk or satin materials helps reduce friction and moisture loss, preventing breakage."
                                        "Tip: Consider wearing a satin bonnet every night or switching to a 100% silk pillowcase for extra protection. If your hair is dry, try a light mist of water or leave-in conditioner before wrapping it at night.</p>";

                                    // ✅ Fetch AI Response
                                    await fetchResponse([
                                      nutrition,
                                      ingredient,
                                      scalp,
                                      sleep,
                                      stress,
                                      hairMain
                                    ]);

                                    // ✅ Update Database & Send Email

                                    await sendEmails(
                                      questionnaire.getEmail(),
                                      "<h3>Hello ${questionnaire.getCurrentUsername()},</h3> "
                                      "<div >"
                                      "<p>Thank you for completing your Hair Needs Assessment! Understanding your current hair habits is the first step toward healthier, stronger hair.</p> "
                                      "<p>This personalized report gives you an overview of your current routine and offers recommendations based on the NISH framework—Nutrition, Ingredients, Scalp Care, Sleep, Stress Management, and Hair Maintenance.</p>"
                                      "<p>We’ve broken down your results into key areas, highlighting your strengths and suggesting areas for improvement. Let’s take a look at your hair journey so far!</p>"
                                      "</div>"
                                      "<h3>Your Hair Assessment Results</h3>"
                                      "<p> <b>Nutrition:</b></p>"
                                      "<p>${response[0]}</p>"
                                      "<p> <b>Ingredient:</b></p>"
                                      "<p>${response[1]}</p>"
                                      "<p> <b>Scalp:</b></p>"
                                      "<p>${response[2]}</p>"
                                      "<p> <b>Sleep:</b></p>"
                                      "<p>${response[3]}</p>"
                                      "<p> <b>Stress:</b></p>"
                                      "<p>${response[4]}</p>"
                                      "<p> <b>Hair Maintenance:</b></p>"
                                      "<p>${response[5]}</p>",
                                    );
                                    await updateResponse(
                                        questionnaire.getEmail()!,
                                        responseText);

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

                      if (widget.feedback != null)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            widget.feedback, // ✅ Updates dynamically
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
