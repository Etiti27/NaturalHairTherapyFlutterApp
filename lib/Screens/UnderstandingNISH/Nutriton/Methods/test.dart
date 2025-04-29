import 'package:flutter/material.dart';

class RadioListExample extends StatefulWidget {
  const RadioListExample({super.key});

  @override
  State<RadioListExample> createState() => _RadioListExampleState();
}

class _RadioListExampleState extends State<RadioListExample> {
  String? selectedOption;

  final List<String> options = [
    'Protein-rich foods',
    'Healthy fats',
    'Vitamins & minerals',
    'Hydration',
    'Digestive support'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Your Focus')),
      body: ListView.builder(
        itemCount: options.length,
        itemBuilder: (context, index) {
          final item = options[index];
          return RadioListTile<String>(
            title: Text(item),
            value: item,
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value;
              });
            },
          );
        },
      ),
    );
  }
}
