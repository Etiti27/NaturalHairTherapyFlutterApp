import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Stress/Method/StressFlipCard.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';

class stress4 extends StatefulWidget {
  const stress4({super.key});
  static const String id = "stress4";

  @override
  State<stress4> createState() => _stress4State();
}

class _stress4State extends State<stress4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: FlipcardStressWidget(),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
