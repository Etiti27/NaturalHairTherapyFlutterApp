import 'package:natural_hair_therapist/imports.dart';

import 'Methods/QuestionB.dart';

class Ingredient6 extends StatefulWidget {
  const Ingredient6({super.key});
  static const String id = "ingredient6";

  @override
  State<Ingredient6> createState() => _Ingredient6State();
}

class _Ingredient6State extends State<Ingredient6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: '🌿 Hair Needs Assessment',
        subheader: 'What Does Your Hair Need Right Now?',
        note: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              """Every head of hair is different, and what your hair needs right now may be different from what it needed last month. 
              
              This quick check-in will help you understand your current hair need—whether it’s more moisture, more strength, or a bit of balance.
              
              Let’s find out what your hair is asking for.""",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
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
          QuestionB(context);
        },
        Section4: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
          onPressed: () {
            Navigator.pushReplacementNamed(context, IntroNISH.id);
          },
          child: const Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
        ),
        nextButtonText: 'Assessment',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
