import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Nutriton/classesInsideNutrition/NutritionMode.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Scalp/Scalp2.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';
import '../../../Widgets/GrowYourHairWelcome.dart';

class Scalp1 extends StatefulWidget {
  const Scalp1({super.key});
  static const String id = "scalp1";

  @override
  State<Scalp1> createState() => _Scalp1State();
}

class _Scalp1State extends State<Scalp1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'SCALP CARE',
        subheader: 'The Womb of the Hair Deserves Daily Love',
        note: NutritionModal(
          text1: "Why Scalp Care Matters",
          htmlCustom: Html(
            style: {
              "body": Style(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: FontSize(20),
                textAlign: TextAlign.justify,
              ),
              "b": Style(
                color: Colors.red,
                fontSize: FontSize(23),
              )
            },
            data:
                "The scalp is more than just the skin that covers your head — it’s the feeding soil of your hair. It’s where hair begins its journey — where it’s born, fed, and supported. In the Natural Hair Therapist philosophy, we call it <b>the womb of the hair.</b>",
          ),
        ),
        nextButton: () {
          Navigator.pushNamed(context, scalp2.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
