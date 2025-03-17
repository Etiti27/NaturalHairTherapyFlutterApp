import 'package:natural_hair_therapist/imports.dart';

class Growyourhair3 extends StatefulWidget {
  const Growyourhair3({super.key});
  static const String id = "growyourhair3";

  @override
  State<Growyourhair3> createState() => _Growyourhair3State();
}

class _Growyourhair3State extends State<Growyourhair3> {
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
              kGrowYourHairText3,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              kGrowYourHairText3b,
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
