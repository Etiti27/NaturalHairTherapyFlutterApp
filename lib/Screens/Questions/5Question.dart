import 'package:natural_hair_therapist/imports.dart';

class Question5 extends StatefulWidget {
  static const String id = "Question5";

  Question5({super.key});

  @override
  State<Question5> createState() => _Question5State();
}

class _Question5State extends State<Question5> {
  String feedback = "Please select an option.";
  bool isValued = false;

  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);

    return QuestionsDynamics(
      questionnaire: questionnaire,
      questionnairAnswer: questionnaire.getHairGrowthAnswer5(),
      OnChange: (String? value) {
        questionnaire.updateHairGrowthAnswer5(value!);
        setState(() {
          feedback = "";
          isValued = true;
        });
      },
      list: ["Yes", "Regularly", "Occasionally", "No"],
      feedback: feedback,
      isValue: isValued,
    );
  }
}
