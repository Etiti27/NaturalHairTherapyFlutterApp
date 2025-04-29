import 'package:flutter/material.dart';

import '../../../Widgets/AppBarWidget.dart';
import '../../../Widgets/BottomWidget.dart';
import 'Method/flipcard2.dart';

class scalp4 extends StatefulWidget {
  const scalp4({super.key});
  static const String id = "scalp4";

  @override
  State<scalp4> createState() => _scalp4State();
}

class _scalp4State extends State<scalp4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: const FlipcardScalpWidget(),
      // WelcomeHair(
      //   header: 'SCALP CARE',
      //   subheader: 'Scalp Health Is Key to Long-Term Hair Health',
      //   note: FlipcardScalpWidget(),
      //   nextButton: () {
      //     Navigator.pushNamed(context, stress1.id);
      //   },
      //   nextButtonText: 'Next >>',
      // ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
