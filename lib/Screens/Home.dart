import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Constants.dart';
import 'package:natural_hair_therapist/Methods/NaturalHairQuote.dart';
import 'package:natural_hair_therapist/Methods/PostgreSQL.dart';
import 'package:natural_hair_therapist/Screens/Dashboard.dart';

import '../Methods/BackgroundImage.dart';
import '../Methods/secondaryNavigation.dart';
import '../Widgets/AppBarWidget.dart';
import '../Widgets/BottomWidget.dart';
import '../Widgets/ButtonWidget.dart';

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
    // print(quoteLength);
    Random random = Random();
    int randomNumber = random.nextInt(quoteLength);
    return quote.getQuote(randomNumber);
  }

  Future<void> postgres() async {
    DatabaseService postgre = DatabaseService();
    await postgre.ensureConnected();
    List userData = await postgre.fetchUsers();

    print(userData);
    // postgre.closeConnection();
  }

  Future<void> updateResponse(String email, String response) async {
    DatabaseService postgre = DatabaseService();
    await postgre.ensureConnected();
    await postgre.updateResponse(email, response);
    // postgre.closeConnection();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(displayingQuote);
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: double.infinity,
            decoration: BackgroundImage(),
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: SecondaryNavigation(
                      title: " ",
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: Card(
                        child: Text(
                          displayingQuote,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: kPrimaryColor,
                            fontFamily: "Roboto-bold",
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 50.0, left: 40.0, right: 40.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: FilledButtonWID(
                            text: const Text("Get Started"),
                            onpressed: () {
                              // Navigator.pushNamed(context, Login.id);
                              Navigator.pushNamed(context, Dashboard.id);
                            },
                          ),
                        ),
                        Expanded(
                          child: FilledButtonWID(
                            text: const Text("postgressws"),
                            onpressed: () {
                              postgres();
                              updateResponse("christopherobinna27@gmail.com",
                                  "wererdfdeerr");
                              // Navigator.pushNamed(context, Dashboard.id);
                              // Navigator.pushNamed(context, Login.id);
                            },
                          ),
                        ),
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
