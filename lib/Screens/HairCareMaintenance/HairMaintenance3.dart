import 'package:natural_hair_therapist/imports.dart';

class HairMaintenance3 extends StatefulWidget {
  const HairMaintenance3({super.key});
  static const String id = "hairMaintenance3";

  @override
  State<HairMaintenance3> createState() => _HairMaintenance3State();
}

class _HairMaintenance3State extends State<HairMaintenance3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'HAIR MAINTENANCE',
        subheader: 'Length Retention: Keeping the Length You’ve Grown',
        note: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kHAIRMAINTENANCE3,
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
          Navigator.pushNamed(context, Dashboard2.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
