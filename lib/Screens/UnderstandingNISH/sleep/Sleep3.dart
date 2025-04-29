import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/sleep/Method/flipcard.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';

class sleep3 extends StatefulWidget {
  const sleep3({super.key});
  static const String id = "sleep3";

  @override
  State<sleep3> createState() => _sleep3State();
}

class _sleep3State extends State<sleep3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: FlipcardSleepWidget(),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
