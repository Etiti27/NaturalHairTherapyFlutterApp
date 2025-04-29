import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';
import '../../../Widgets/GrowYourHairWelcome.dart';
import '../Nutriton/classesInsideNutrition/NutritionMode.dart';
import 'Ingredient3.dart';

class Ingredient2 extends StatefulWidget {
  const Ingredient2({super.key});
  static const String id = "ingredient2";

  @override
  State<Ingredient2> createState() => _Ingredient2State();
}

class _Ingredient2State extends State<Ingredient2> {
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
                // text1: "Why Ingredients Matter for Hair Health",
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
                  """This is why the Natural Hair Therapist doesn’t work with hair typing systems like 3A, 4C, etc. We don’t believe in choosing a product based on curl pattern alone. 
                  What really matters is your hair need.So before buying your next product based on your cousin’s-sister’s--uncle’s-brother’s wife recommendation or TikTok trend, stop and ask:
                  <b>What does my hair need right now?</b>
                  Then, learn which ingredients match that need.
                  """,
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
          Navigator.pushNamed(context, Ingredient3.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
