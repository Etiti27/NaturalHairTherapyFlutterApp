import 'package:flutter/material.dart';

import '../Constants.dart';

class DynamicRadioSelect extends StatelessWidget {
  DynamicRadioSelect({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.OnChange,
    required this.texts,
    this.nextButtonAppearance,
    this.prevButtonAppearance,
    // required this.valued,
  });
  final ValueChanged<String?> OnChange;
  final String texts;
  final Widget? nextButtonAppearance;
  final ElevatedButton? prevButtonAppearance;
  // final String valued;

  // = ["Flutter", "Dart", "React", "Java"];

  final List<String> options;
  String selectedValue = "Flutter"; // Default selection

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                texts,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Column(
                children: options.map((option) {
                  return RadioListTile<String>(
                    title: Text(
                      option,
                      style: TextStyle(color: Colors.white),
                    ),
                    value: option,

                    // contentPadding: EdgeInsets.symmetric(
                    //     vertical: 0, horizontal: 8), // ✅ Reduce spacing
                    dense: true, // ✅ Makes the tiles more compact
                    visualDensity: VisualDensity
                        .adaptivePlatformDensity, // ✅ Reduces default padding
                    groupValue: selectedValue,
                    onChanged: OnChange!,
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
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
    );
  }
}
