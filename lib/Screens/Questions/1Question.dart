import 'package:natural_hair_therapist/imports.dart';

class Questiononescreen extends StatefulWidget {
  static const String id = "Question1";

  const Questiononescreen({super.key});

  @override
  State<Questiononescreen> createState() => _QuestiononescreenState();
}

class _QuestiononescreenState extends State<Questiononescreen> {
  String feedBackMessage = "Please select an option.";
  bool isValued = false;
  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    return QuestionsDynamics(
      feedback: feedBackMessage,
      questionnaire: questionnaire,
      questionnairAnswer: questionnaire.getHairGrowthAnswer1(),
      OnChange: (String? value) {
        questionnaire.updateNutritionAnswer1(value!);
        setState(() {
          feedBackMessage = "";
          isValued = true;
        });
      },
      list: const ["Daily", "A few times a week", "Rarely", "Never"],
      isValue: isValued,
    );
  }
}
