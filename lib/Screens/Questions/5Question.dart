import 'package:natural_hair_therapist/imports.dart';

class Question5 extends StatelessWidget {
  static const String id = "Question5";

  const Question5({super.key});

  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    return QuestionsDynamics(
      questionnaire: questionnaire,
      questionnairAnswer: questionnaire.getHairGrowthAnswer5(),
      OnChange: (String? value) {
        questionnaire.updateHairGrowthAnswer5(value!);
      },
      list: ["Yes", "Regularly", "Occasionally", "No"],
    );
  }
}
