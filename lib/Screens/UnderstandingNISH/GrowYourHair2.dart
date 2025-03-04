import 'package:natural_hair_therapist/imports.dart';

class Growyourhair2 extends StatefulWidget {
  const Growyourhair2({super.key});
  static const String id = "growyourhair2";

  @override
  State<Growyourhair2> createState() => _Growyourhair2State();
}

class _Growyourhair2State extends State<Growyourhair2> {
  @override
  List<String> nishTopics = [
    "Nutrition",
    "Ingredients",
    "Scalp Care",
    "Sleep & Stress Management",
    "Hair Maintenance",
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'Grow Your Hair',
        subheader: 'Welcome to Your Hair Growth Journey!',
        note: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "On this journey, we’ll be focusing on NISH:",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ...nishTopics.map((item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    "* $item",
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            const SizedBox(height: 10),
            const Text(
              textAlign: TextAlign.justify,
              "NISH is a unique, holistic hair care framework developed by your Natural Hair Therapist (NHT) to give your body exactly what it needs for healthy hair growth.",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        nextButton: () {
          Navigator.pushNamed(context, Growyourhair3.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
