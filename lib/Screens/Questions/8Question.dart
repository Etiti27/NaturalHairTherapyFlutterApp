import 'package:natural_hair_therapist/imports.dart';

class Question8 extends StatefulWidget {
  static const String id = "Question8";

  const Question8({super.key});

  @override
  State<Question8> createState() => _Question8State();
}

class _Question8State extends State<Question8> {
  String feedback = "Please select an option.";
  bool isValued = false;
  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    return QuestionsDynamics(
      questionnaire: questionnaire,
      questionnairAnswer: questionnaire.getHairGrowthAnswer8(),
      OnChange: (String? value) {
        questionnaire.updateHairGrowthAnswer8(value);
        setState(() {
          feedback = "";
          isValued = true;
        });
      },
      list: const ["Low", "Moderate", "High"],
      feedback: feedback,
      isValue: isValued,
    );
  }
}
