import 'package:natural_hair_therapist/imports.dart';

class Question3 extends StatefulWidget {
  static const String id = "Question3";

  const Question3({super.key});

  @override
  State<Question3> createState() => _Question3State();
}

class _Question3State extends State<Question3> {
  // ✅ Default empty feedback to prevent null issues

  // ✅ Feedback messages mapped to each ingredient
  final Map<String, String> feedbackMessages = {
    "Castor Oil":
        "Great choice! Castor oil is rich in nutrients and known for its moisturizing and strengthening properties, which can support hair thickness and shine.",
    "Coconut Oil":
        "Excellent pick! Coconut oil penetrates the hair shaft deeply, helping to reduce protein loss and keep your hair hydrated.",
    "Aloe vera":
        "Aloe vera is a fantastic ingredient! It soothes the scalp, helps with hydration, and can support healthy hair growth.",
    "Shea Butter":
        "Good choice! Shea butter is highly moisturizing and protective, especially beneficial for dry and textured hair types.",
    "Sodium Cocoyl Isethionate":
        "This is a gentle sulfate-free surfactant derived from coconut oil. It effectively cleanses without stripping the hair’s natural oils, making it a great option for maintaining moisture and softness.",
    "Cetyl Alcohol":
        "Great choice! Cetyl alcohol is a fatty alcohol that conditions and softens hair. It helps improve moisture retention and makes hair products creamier for easier application."
  };
  String feedback = "Please select an option.";
  bool isValued = false;

  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);

    return QuestionsDynamics(
      feedback: feedback,

      questionnaire: questionnaire,
      questionnairAnswer: questionnaire.getHairGrowthAnswer3(),
      OnChange: (String? value) {
        if (value != null) {
          questionnaire.updateHairGrowthAnswer3(value);

          // ✅ Use setState() to update UI dynamically
          setState(() {
            feedback = feedbackMessages[value] ?? "Please select an option.";
            isValued = true;
          });
        }
      },
      list: feedbackMessages.keys.toList(),
      isValue: isValued, // ✅ Automatically uses keys from the feedback map
    );
  }
}
