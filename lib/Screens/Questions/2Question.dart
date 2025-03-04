import 'package:natural_hair_therapist/imports.dart';

class Question2 extends StatelessWidget {
  static const String id = "Question2";

  const Question2({super.key});

  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    return QuestionsDynamics(
      questionnaire: questionnaire,
      questionnairAnswer: questionnaire.getHairGrowthAnswer2(),
      OnChange: (String? value) {
        questionnaire.updateHairGrowthAnswer2(value);
      },
      list: const ["Yes", "Regularly", "Occasionally", "No"],
    );
  }
}
