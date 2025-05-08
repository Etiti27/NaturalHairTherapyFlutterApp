import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/HairMain/Method/FlipCardHairMaint.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';

class HairMaint4 extends StatefulWidget {
  const HairMaint4({super.key});
  static const String id = "hairmaint4";

  @override
  State<HairMaint4> createState() => _HairMaint4State();
}

class _HairMaint4State extends State<HairMaint4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: const FlipcardHairMaintWidget(),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
