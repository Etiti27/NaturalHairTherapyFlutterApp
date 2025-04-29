import 'package:natural_hair_therapist/imports.dart';

import '../Nutriton/classesInsideNutrition/NutritionMode.dart';

class Ingredient3 extends StatefulWidget {
  const Ingredient3({super.key});
  static const String id = "ingredient3";

  @override
  State<Ingredient3> createState() => _Ingredient3State();
}

class _Ingredient3State extends State<Ingredient3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'INGREDIENT',
        subheader: '',
        note: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NutritionModal(
              // text1: "Why Ingredients Matter for Hair Health",
              text1:
                  """Ingredients behave uniquely based on factors like climate, humidity, and individual hair characteristics""",
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
          Navigator.pushNamed(context, Ingredient4.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
