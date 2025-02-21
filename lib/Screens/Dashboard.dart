import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Methods/Firebase.dart';
import 'package:natural_hair_therapist/Widgets/AppBarWidget.dart';
import 'package:provider/provider.dart';

import '../Constants.dart';
import '../Methods/ProviderPackage.dart';
import '../Widgets/BottomWidget.dart';
import '../Widgets/DashboardCard.dart';
import 'GrowYourHair.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  static const String id = "dashboard";

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controllerAnimation;

  @override
  void initState() {
    super.initState();
    getUser();
    _controllerAnimation = AnimationController(
      duration: const Duration(seconds: 2), // Duration of the animation
      vsync: this,
    );

    // Define a color tween animation

    // Start the animation and loop it
    _controllerAnimation.forward();
    _controllerAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controllerAnimation.reverse(); // Reverse the animation when completed
      } else if (status == AnimationStatus.dismissed) {
        _controllerAnimation
            .forward(); // Start the animation again when dismissed
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controllerAnimation.dispose();
    if (kDebugMode) {
      print("he was disponsed");
    }
  }

  bool isResponse = false;

  String response = "";
  FirebaseMethods firebases = FirebaseMethods();
  List<String> activities = ["Grow Hair", "Stop Hair Loss", "Stop Breakage"];
  String userName = "";
  String email = "";
  final List<String> imageList = ["assets/images/logo.png"];

  void getUser() async {
    await firebases.setCurrentUserName();

    setState(() {
      userName = firebases.getCurrentUserName();
      email = firebases.getEmail()!;
    });
  }

  final bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    // getUser();
    print("my email : $email");
    return Scaffold(
      appBar: AppBarWidget(),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  // SecondaryNavigation(title: "My Dashboard"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome $userName",
                          style: const TextStyle(
                              fontSize: 30,
                              fontFamily: "Roboto-Bold",
                              color: kPrimaryColor),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "I want to...",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Roboto-Bold",
                        color: kPrimaryColor),
                  ),
                  Row(
                    children: [
                      DashboardCard(
                        imagePath: 'assets/images/logo.png',
                        title: 'Grow Hair',
                        OnTap: () {
                          questionnaire.updateCurrentUsername(userName);
                          questionnaire.updateEmail(email);

                          Navigator.pushNamed(context, Growyourhair.id);
                        },
                      ),
                      DashboardCard(
                        imagePath: 'assets/images/logo.png',
                        title: 'Stop Hair Loss',
                        OnTap: () {},
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      DashboardCard(
                        imagePath: 'assets/images/logo.png',
                        title: 'Stop Breakage',
                        OnTap: () {},
                      ),
                      DashboardCard(
                        imagePath: 'assets/images/logo.png',
                        title: 'Stop Breakage',
                        OnTap: () {
                          Navigator.pushNamed(context, Growyourhair.id);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Learn"),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor),
                    child: const Text("NISH philosophy",
                        style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
            ),
      bottomNavigationBar: BottomWidget(),
      // resizeToAvoidBottomInset: true,
    );
  }
}
