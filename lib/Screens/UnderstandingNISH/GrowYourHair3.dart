import 'package:natural_hair_therapist/imports.dart';

class Growyourhair3 extends StatefulWidget {
  const Growyourhair3({super.key});
  static const String id = "growyourhair3";

  @override
  State<Growyourhair3> createState() => _Growyourhair3State();
}

class _Growyourhair3State extends State<Growyourhair3> {
  @override
  List<String> nishTopics = [
    "Support your hair from the inside out",
    "Keep the length you’ve worked so hard for",
    "Understand what your hair truly needs",
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
              "Together, we’ll explore simple ways to:",
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
                    "• $item",
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            const SizedBox(height: 10),
            const Text(
              "Let’s get started and give your hair the best care possible!",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        nextButton: () {
          Navigator.pushNamed(context, Growyourhair4.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
