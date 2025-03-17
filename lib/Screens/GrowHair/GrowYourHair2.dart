import 'package:natural_hair_therapist/imports.dart';

class Growyourhair2 extends StatefulWidget {
  const Growyourhair2({super.key});
  static const String id = "growyourhair2";

  @override
  State<Growyourhair2> createState() => _Growyourhair2State();
}

class _Growyourhair2State extends State<Growyourhair2> {
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
              kGrowYourHairText2,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              kGrowYourHairText2b,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 90,
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
