import 'dart:math';

import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Constants.dart';
import 'package:natural_hair_therapist/Methods/NaturalHairQuote.dart';

import '../Widgets/AppBarWidget.dart';
import '../Widgets/BottomWidget.dart';
import '../Widgets/ButtonWidget.dart';
import 'Login.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const id = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    displayingQuote = getQuote();
  }

  late String displayingQuote;
  // Generates a random integer between 50 and 99
  String getQuote() {
    Quote quote = Quote();
    int quoteLength = quote.quoteLength();
    print(quoteLength);
    Random random = Random();
    int randomNumber = random.nextInt(quoteLength);
    return quote.getQuote(randomNumber);
  }

  @override
  Widget build(BuildContext context) {
    print(displayingQuote);
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(
          logo: const Image(
            image: AssetImage("assets/images/logo.png"),
            color: kPrimaryColor,
          ),
          title: "Natural Hair Therapist",
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo.png"),
                fit: BoxFit.fill,
                opacity: 0.3,
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                        child: Card(
                      child: Text(
                        displayingQuote,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Roboto-bold",
                          fontSize: 40,
                        ),
                      ),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 50.0, left: 40.0, right: 40.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: FilledButtonWID(
                            text: Text("Get Started"),
                            onpressed: () {
                              Navigator.pushNamed(context, Login.id);
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomWidget(),
      ),
    );
  }
}
