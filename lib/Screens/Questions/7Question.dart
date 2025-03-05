import 'package:natural_hair_therapist/imports.dart';

class Question7 extends StatefulWidget {
  static const String id = "Question7";

  const Question7({super.key});

  @override
  State<Question7> createState() => _Question7State();
}

class _Question7State extends State<Question7> {
  String feedback = "Please select an option.";
  bool isValued = false;
  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);

    return QuestionsDynamics(
      questionnaire: questionnaire,
      questionnairAnswer: questionnaire.getHairGrowthAnswer7(),
      OnChange: (String? value) {
        questionnaire.updateHairGrowthAnswer7(value!);
        setState(() {
          feedback = "";
          isValued = true;
        });
      },
      list: ["Yes, every night", "Sometimes", "Never"],
      feedback: feedback,
      isValue: isValued,
    );
  }
}
