import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';
import '../../../Widgets/GrowYourHairWelcome.dart';
import '../Nutriton/classesInsideNutrition/NutritionMode.dart';
import 'Ingredient2.dart';

class Ingredient extends StatefulWidget {
  const Ingredient({super.key});
  static const String id = "ingredient";

  @override
  State<Ingredient> createState() => _IngredientState();
}

class _IngredientState extends State<Ingredient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'INGREDIENT',
        subheader: 'Know What’s In Your Product – And Why That Matters',
        note: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NutritionModal(
                text1: "Why Ingredients Matter for Hair Health",
                htmlCustom: Html(
                  style: {
                    "b": Style(
                      fontWeight: FontWeight.w700,
                      color: Colors.red, // dark green, for example
                    ),
                    "body": Style(
                        fontSize: FontSize(20.0),
                        textAlign: TextAlign.justify,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  },
                  data:
                      """Ingredients are the compounds that make up every product you use in your hair — from your shampoo and conditioner to your leave-ins and oils. Each ingredient has a specific purpose, and how your hair responds to that ingredient depends on your hair’s <b>needs</b>, not its <b>type.</b>""",
                )

                // """Ingredients are the compounds that make up every product you use in your hair — from your shampoo and conditioner to your leave-ins and oils. Each ingredient has a specific purpose, and how your hair responds to that ingredient depends on your hair’s <b>needs</b>, not its type.""",
                ),
            // const SizedBox(height: 10),
            // SizedBox(height: 10),
            // Text(
            //   textAlign: TextAlign.justify,
            //   "NISH is a unique, holistic hair care framework developed by your Natural Hair Therapist (NHT) to give your body exactly what it needs for healthy hair growth.",
            //   style: TextStyle(
            //     fontSize: 25,
            //     color: Colors.white,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ],
        ),
        nextButton: () {
          Navigator.pushNamed(context, Ingredient2.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
