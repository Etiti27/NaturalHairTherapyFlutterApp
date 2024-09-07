import 'package:flutter/material.dart';

import '../Widgets/AppBarWidget.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const id = "home";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(
          logo: const Image(
            image: AssetImage("assets/images/logo.png"),
            color: Colors.green,
          ),
          title: "Natural Hair Therapy",
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              opacity: 0.2,
              image: AssetImage("assets/images/logo.png"),
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20.0),
            // height: 20.0,
            color: const Color(0xff8ba870),
            child: const Text(
              "Data",
              style: TextStyle(
                  // backgroundColor: Color(0xff8ba870),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
// backgroundColor: const Color(0xff8ba870),
