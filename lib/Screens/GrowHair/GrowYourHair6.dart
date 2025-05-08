import 'package:natural_hair_therapist/imports.dart';

class Growyourhair6 extends StatefulWidget {
  const Growyourhair6({super.key});
  static const String id = "growyourhair6";

  @override
  State<Growyourhair6> createState() => _Growyourhair6State();
}

class _Growyourhair6State extends State<Growyourhair6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'Grow Your Hair',
        subheader: '',
        note: const Column(
          children: [
            Text(
              kGrowYourHairText6,
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
          Navigator.pushNamed(context, Dashboard2.id);
        },
        nextButtonText: 'Next >>',
        Section4: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, Questiononescreen.id);
          },
          style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
          child: const Text(
            "Hair Scan",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
