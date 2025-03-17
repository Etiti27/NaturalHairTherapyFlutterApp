import 'package:natural_hair_therapist/imports.dart';

class Question6 extends StatefulWidget {
  static const String id = "Question6";

  const Question6({super.key});

  @override
  State<Question6> createState() => _Question6State();
}

class _Question6State extends State<Question6> {
  String selected = "yes";
  String feedback = "Please select an option.";
  bool isValued = false;
  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    return QuestionsDynamics(
      questionnaire: questionnaire,
      questionnairAnswer: questionnaire.getHairGrowthAnswer6(),
      OnChange: (String? value) {
        questionnaire.updateHairGrowthAnswer6(value!);
        setState(() {
          feedback = "";
          isValued = true;
        });
      },
      list: const ["Yes", "Often", "Occasionally", "No"],
      feedback: feedback,
      isValue: isValued,
    );
  }
}
