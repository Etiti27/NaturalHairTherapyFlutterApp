import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Ingredient/Ingredient5a.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';
import '../../../Widgets/GrowYourHairWelcome.dart';
import '../Nutriton/classesInsideNutrition/NutritionMode.dart';

class Ingredient4b extends StatefulWidget {
  const Ingredient4b({super.key});
  static const String id = "ingredient4b";

  @override
  State<Ingredient4b> createState() => _Ingredient4bState();
}

class _Ingredient4bState extends State<Ingredient4b> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'INGREDIENT',
        subheader: 'Categories of Ingredients in Hair Maintenance Products',
        note: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NutritionModal(
              text1: "Proteins",
              text2:
                  "Strengthen the hair structure, reducing breakage (e.g., hydrolyzed keratin, silk proteins).",
            ),
            NutritionModal(
              text1: "Cleansing Agents",
              text2:
                  "Remove dirt and buildup from the hair and scalp (e.g., sodium cocoyl isethionate, a mild sulfate found in some shampoos).",
            ),
          ],
        ),
        nextButton: () {
          Navigator.pushNamed(context, Ingredient5a.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
