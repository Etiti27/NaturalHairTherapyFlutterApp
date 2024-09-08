import 'package:flutter/material.dart';

import '../Constants.dart';

class DateOfBirthScreen extends StatefulWidget {
  const DateOfBirthScreen({Key? key});

  @override
  _DateOfBirthScreenState createState() => _DateOfBirthScreenState();
}

class _DateOfBirthScreenState extends State<DateOfBirthScreen> {
  // Controller to display the selected date in the TextField
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose(); // Dispose the controller when not needed
    super.dispose();
  }

  // Function to show the date picker dialog
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Current date
      firstDate: DateTime(1900), // Earliest date
      lastDate: DateTime.now(), // Latest date (today)
      helpText:
          'Select Date of Birth', // Can be used to change the help text in the date picker
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text =
            _formatDate(pickedDate); // Format and set the selected date
      });
    }
  }

  // Helper function to format the selected date
  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}'; // YYYY-MM-DD format
  }

  @override
  Widget build(BuildContext context) {
    print(_dateController.text);
    return TextField(
      controller: _dateController,
      decoration: const InputDecoration(
        focusColor: kPrimaryColor,
        labelText: 'Date of Birth',
        hintText: 'YYYY-MM-DD',

        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kPrimaryColor,
            width: 3.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        suffixIcon: Icon(
          Icons.calendar_today,
          color: kPrimaryColor,
        ), // Calendar icon to indicate date picking
      ),
      readOnly: true, // Make the TextField read-only to prevent manual input
      onTap: () => _selectDate(context), // Show date picker when tapped
    );
  }
}
