import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Nutriton/classesInsideNutrition/NutritionMode.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Scalp/Scalp3.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';
import '../../../Widgets/GrowYourHairWelcome.dart';

class scalp2 extends StatefulWidget {
  const scalp2({super.key});
  static const String id = "scalp2";

  @override
  State<scalp2> createState() => _scalp2State();
}

class _scalp2State extends State<scalp2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'SCALP CARE',
        subheader: 'The Womb of the Hair Deserves Daily Love',
        note: NutritionModal(
          text2:
              """Underneath the surface of your scalp are hair follicles. Inside each follicle, in a part called the dermal papilla, new hair cells are created through cell division.""",
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
            data: """
                These cells are pushed upward and hardened to form a strand of hair. The only way this process can work well is if the scalp is nourished, oxygenated, clean, and healthy.""",
          ),
        ),
        nextButton: () {
          Navigator.pushNamed(context, scalp3.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
