import 'package:natural_hair_therapist/Widgets/NutritionSection.dart';
import 'package:natural_hair_therapist/imports.dart';

import 'Methods/showSideModal1.dart';
import 'Methods/showSideModal2.dart';
import 'Methods/showSideModal3.dart';

class NISH1 extends StatefulWidget {
  const NISH1({super.key});
  static const String id = "nish1";

  @override
  State<NISH1> createState() => _NISH1State();
}

class _NISH1State extends State<NISH1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: NutritionSection(
        header: 'NUTRITION',
        subheader: 'Feed Your Hair from the Inside Out',
        note: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kNish1,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Section1: ElevatedButton(
          onPressed: () {
            // Call the _showSideModal function when Section1 is clicked
            showSideModal1(context);
          },
          child: Text(
            "Intro",
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
        ),
        Section2: ElevatedButton(
          onPressed: () {
            showSideModal2(context);
          },
          child: Text(
            "Building Blocks",
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
        ),
        Section3: ElevatedButton(
          onPressed: () {
            showSideModal3(context);
          },
          child: Text(
            "Gut Health",
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
        ),
        prevButton: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: kPrimaryColor,
          ),
        ),
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }

  //second2
}
