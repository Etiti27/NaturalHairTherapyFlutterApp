import 'package:natural_hair_therapist/imports.dart';

class Question2 extends StatefulWidget {
  static const String id = "Question2";

  const Question2({super.key});

  @override
  State<Question2> createState() => _Question2State();
}

class _Question2State extends State<Question2> {
  String feedback = "Please select an option";
  bool isValued = false;
  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    return QuestionsDynamics(
      questionnaire: questionnaire,
      questionnairAnswer: questionnaire.getHairGrowthAnswer2(),
      OnChange: (String? value) {
        questionnaire.updateHairGrowthAnswer2(value);
        setState(() {
          feedback = "";
          isValued = true;
        });
      },
      list: const ["Yes", "Regularly", "Occasionally", "No"],
      feedback: feedback,
      isValue: isValued,
    );
  }
}
