import 'package:natural_hair_therapist/imports.dart';

class Question10 extends StatefulWidget {
  static const String id = "Question10";

  const Question10({super.key});

  @override
  State<Question10> createState() => _Question10State();
}

class _Question10State extends State<Question10> {
  String feedback = "Please select an option.";
  bool isValued = false;
  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    return QuestionsDynamics(
      questionnaire: questionnaire,
      questionnairAnswer: questionnaire.getHairGrowthAnswer10(),
      OnChange: (String? value) {
        questionnaire.updateHairGrowthAnswer10(value!);
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
