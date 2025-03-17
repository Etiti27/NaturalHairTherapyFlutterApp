import 'package:flutter/material.dart';

import '../Constants.dart';
import '../Methods/BackgroundImage.dart';

class QuestionScreens extends StatelessWidget {
  const QuestionScreens({
    super.key,
    required this.questionnaireAnswer,
    required this.text,
    required this.listOfAnswer,
    required this.OnChange,
    this.nextButtonAppearance,
    this.prevButtonAppearance,
  });

  final String text;
  final String? questionnaireAnswer;
  final List<String> listOfAnswer;
  final ValueChanged<String?> OnChange;

  final Widget? nextButtonAppearance;
  final ElevatedButton? prevButtonAppearance;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BackgroundImage(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Card(
            color: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ✅ Radio Buttons Instead of Dropdown
                  Column(
                    children: listOfAnswer.map((option) {
                      return RadioListTile<String>(
                        title: Text(
                          option,
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        value: option,
                        groupValue: questionnaireAnswer,
                        onChanged: OnChange,
                        activeColor:
                            Colors.white, // ✅ Selected radio button color
                        selected: questionnaireAnswer == option,
                        fillColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                            if (states.contains(WidgetState.selected)) {
                              return Colors.white; // ✅ Active color
                            }
                            return Colors.white; // ✅ Inactive color
                          },
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 20),

                  // ✅ Button Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (prevButtonAppearance != null) prevButtonAppearance!,
                      if (nextButtonAppearance != null) nextButtonAppearance!,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
