import 'package:flutter/material.dart';

class Dropdownquestionaire extends StatelessWidget {
  Dropdownquestionaire(
      {super.key, required this.valueItem, required this.onChange});
  String? valueItem;
  ValueChanged<String?> onChange;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: valueItem,
        hint: const Text("Select an option"),
        items: [
          "Yes, regularly",
          "Occasionally",
          "No",
        ]
            .map((option) => DropdownMenuItem(
                  value: option,
                  child: Text(option),
                ))
            .toList(),
        onChanged: onChange);
  }
}
