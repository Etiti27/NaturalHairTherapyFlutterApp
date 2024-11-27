import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Methods/DropdownQuestionaire.dart';

class QuestionScreen extends StatefulWidget {
  static const String id = "test";
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  String? nutritionAnswer1;
  String? nutritionAnswer2;
  final List<String> selectedIngredients = [];
  final Map<String, String> avoidIngredient = {
    "Sodium Lauryl Sulfate (SLS)":
        "Sodium Lauryl Sulfate is a strong cleanser that can strip natural oils from the hair and scalp, leading to dryness and irritation. If possible, look for gentler sulfate-free cleansers",
    "Mineral Oil":
        "Mineral oil creates a barrier on the hair but doesn’t add moisture. It can weigh down hair and block other nourishing ingredients from penetrating. Consider using natural oils like coconut or jojoba instead.",
    "Isopropyl Alcohol":
        "Isopropyl Alcohol is often found in styling products, but it can be drying and lead to brittle hair. Opt for alcohol-free products or those with fatty alcohols, which are more hydrating.",
    "Sodium Cocoyl Isethionate":
        "Sodium Cocoyl Isethionate is a gentle sulfate-free surfactant derived from coconut oil. It effectively cleanses without stripping the hair’s natural oils, making it a great option for maintaining moisture and softness.",
    "Cetyl Alcohol":
        "Cetyl Alcohol is a fatty alcohol that helps soften and moisturize the hair. Unlike drying alcohols, it’s great for adding smoothness and is especially beneficial for dry or textured hair types.",
  };
  final Map<String, String> ingredientFeedback = {
    "Castor oil":
        "Great choice! Castor oil is rich in nutrients and known for its moisturizing and strengthening properties, which can support hair thickness and shine.",
    "Coconut oil":
        "Excellent pick! Coconut oil penetrates the hair shaft deeply, helping to reduce protein loss and keep your hair hydrated.",
    "Aloe vera":
        "Aloe vera is a fantastic ingredient! It soothes the scalp, helps with hydration, and can support healthy hair growth.",
    "Shea butter":
        "Good choice! Shea butter is highly moisturizing and protective, especially beneficial for dry and textured hair types.",
    "Sodium Laureth Sulfate":
        "Sodium Laureth Sulfate is milder than some sulfates but may still strip oils from hair. If you have dry or sensitive hair, use it sparingly or choose sulfate-free options.",
    "Isopropyl Alcohol":
        "Isopropyl Alcohol is best avoided for hair, as it can be very drying and lead to breakage. Look for alcohol-free or fatty alcohol-based alternatives instead.",
  };

  String? harmfulIngredientAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hair Care Questionnaire"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Nutrition Questions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
                "How often do you include foods high in protein in your diet?"),
            Dropdownquestionaire(
              valueItem: nutritionAnswer1,
              onChange: (String? value) {
                setState(() {
                  nutritionAnswer1 = value;
                });
              },
            ),
            const SizedBox(height: 10),
            const Text(
                "Do you take any supplements for hair or general health?"),
            Dropdownquestionaire(
              valueItem: nutritionAnswer2,
              onChange: (String? value) {
                setState(() {
                  nutritionAnswer2 = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Ingredients Questions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
                "Which of these ingredients do you look for in hair products?"),
            ...ingredientFeedback.keys.map((ingredient) {
              return CheckboxListTile(
                title: Text(ingredient),
                value: selectedIngredients.contains(ingredient),
                onChanged: (isSelected) {
                  setState(() {
                    if (isSelected == true) {
                      selectedIngredients.add(ingredient);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Ingredient Feedback"),
                          content: Text(ingredientFeedback[ingredient]!),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text("OK"),
                            )
                          ],
                        ),
                      );
                    } else {
                      selectedIngredients.remove(ingredient);
                    }
                  });
                },
              );
            }),
            const SizedBox(height: 20),
            const Text(
              "Avoidance Question",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
                "Are you aware of any ingredients that might harm your hair’s health?"),
            DropdownButton<String>(
              value: harmfulIngredientAnswer,
              hint: const Text("Select an ingredient"),
              items: avoidIngredient.keys
                  .map((option) => DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  harmfulIngredientAnswer = value;
                });
              },
            ),
            if (harmfulIngredientAnswer != null)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  avoidIngredient[harmfulIngredientAnswer]!,
                  // "You selected: $harmfulIngredientAnswer. Make sure to avoid this ingredient if it's unsuitable for your hair type.",
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
