import 'package:flutter/material.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';
import '../../../Widgets/GrowYourHairWelcome.dart';
import '../Scalp/Scalp1.dart';
import 'Methods/QuestionB.dart';

class Ingredient7 extends StatefulWidget {
  const Ingredient7({super.key});
  static const String id = "ingredient7";

  @override
  State<Ingredient7> createState() => _Ingredient7State();
}

class _Ingredient7State extends State<Ingredient7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'INGREDIENT',
        subheader: 'A Practical Approach to Selecting Products',
        note: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QuestionB(context),
            const SizedBox(height: 10),
          ],
        ),
        nextButton: () {
          Navigator.pushNamed(context, Scalp1.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
