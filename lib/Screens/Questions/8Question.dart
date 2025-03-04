import 'package:natural_hair_therapist/imports.dart';

class Question8 extends StatelessWidget {
  static const String id = "Question8";

  const Question8({super.key});

  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    return QuestionsDynamics(
      questionnaire: questionnaire,
      questionnairAnswer: questionnaire.getHairGrowthAnswer8(),
      OnChange: (String? value) {
        questionnaire.updateHairGrowthAnswer8(value);
      },
      list: const ["Low", "Moderate", "High"],
    );
  }
}
