import 'package:natural_hair_therapist/imports.dart';

class Question9 extends StatefulWidget {
  static const String id = "Question9";

  const Question9({super.key});

  @override
  State<Question9> createState() => _Question9State();
}

class _Question9State extends State<Question9> {
  String feedback = "Please select an option.";
  bool isValued = false;
  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    return QuestionsDynamics(
      questionnaire: questionnaire,
      questionnairAnswer: questionnaire.getHairGrowthAnswer9(),
      OnChange: (String? value) {
        questionnaire.updateHairGrowthAnswer9(value!);
        setState(() {
          feedback = "";
          isValued = true;
        });
      },
      list: const ["Yes, regularly", "Occasionally", "No"],
      feedback: feedback,
      isValue: isValued,
    );
  }
}
