import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Methods/BackgroundImage.dart';
import 'package:natural_hair_therapist/Methods/ProviderPackage.dart';
import 'package:natural_hair_therapist/Widgets/AppBarWidget.dart';
import 'package:natural_hair_therapist/Widgets/BottomWidget.dart';
import 'package:provider/provider.dart';

import '../Constants.dart';

class Questiononescreen extends StatelessWidget {
  static const String id = "questiononescreen";

  const Questiononescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    return Scaffold(
      appBar: AppBarWidget(),
      body: Container(
        height: double.infinity,
        decoration: BackgroundImage(),
        child: Center(
          child: SingleChildScrollView(
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Card(
                      color: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      // Shadow effect

                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          // Image
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(15.0),
                            ),
                            child: Image.asset(
                              "assets/images/logo.png",
                              height: 100,
                              // width: 70,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  "How often do you include foods high in protein in your diet?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                DropdownButton<String>(
                                  value: questionnaire.nutritionAnswer1,
                                  hint: const Text("Select an option"),
                                  items: [
                                    "Daily",
                                    "A few times a week",
                                    "Rarely",
                                    "Never",
                                  ]
                                      .map((option) => DropdownMenuItem(
                                            value: option,
                                            child: Center(
                                              child: Text(
                                                option,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    questionnaire.updateNutritionAnswer1(value);
                                  },
                                  isExpanded: true,
                                  icon: const Icon(
                                    Icons
                                        .arrow_drop_down, // Adjust the dropdown arrow icon
                                    color: Colors
                                        .white, // Set the color of the arrow
                                    size: 24, // Adjust the size of the arrow
                                  ),
                                  dropdownColor:
                                      kPrimaryColor, // Set dropdown menu color to match the card
                                  style: const TextStyle(
                                    color: Colors
                                        .black, // Set the text color of the selected item
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  underline: Container(
                                    height: 1,
                                    color: Colors
                                        .white, // Add an underline for styling (optional)
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("Next"),
                                    ),
                                  ],
                                ),

                                // Subtitle

                                // Button Row
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
