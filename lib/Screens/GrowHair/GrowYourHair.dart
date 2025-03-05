import 'package:natural_hair_therapist/imports.dart';

class Growyourhair extends StatefulWidget {
  const Growyourhair({super.key});
  static const String id = "growyourhair";

  @override
  State<Growyourhair> createState() => _GrowyourhairState();
}

class _GrowyourhairState extends State<Growyourhair> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'Grow Your Hair',
        subheader: 'Welcome to Your Hair Growth Journey!!',
        note: const Text(
          kGrowYourHairText,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        nextButton: () {
          Navigator.pushNamed(context, Growyourhair2.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
