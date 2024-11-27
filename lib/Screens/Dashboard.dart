import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Methods/Firebase.dart';
import 'package:natural_hair_therapist/Methods/secondaryNavigation.dart';
import 'package:natural_hair_therapist/Screens/QuestionOneScreen.dart';
import 'package:natural_hair_therapist/Widgets/AppBarWidget.dart';

import '../Constants.dart';
import '../Methods/Card.dart';
import '../Widgets/BottomWidget.dart';

class QAScreen extends StatefulWidget {
  const QAScreen({Key? key}) : super(key: key);
  static const String id = "question";

  @override
  _QAScreenState createState() => _QAScreenState();
}

class _QAScreenState extends State<QAScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controllerAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    getUser();
    _controllerAnimation = AnimationController(
      duration: const Duration(seconds: 2), // Duration of the animation
      vsync: this,
    );

    // Define a color tween animation
    _colorAnimation = ColorTween(
      begin: Colors.white,
      end: kPrimaryColor,
    ).animate(_controllerAnimation);

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
    print("he was disponsed");
  }

  bool isResponse = false;
  String response = "";
  FirebaseMethods firebases = FirebaseMethods();
  List<String> activities = ["Grow Hair", "Stop Hair Loss", "Stop Breakage"];
  String userName = "";
  final List<String> imageList = ["assets/images/logo.png"];

  void getUser() async {
    await firebases.setCurrentUserName();

    setState(() {
      userName = firebases.getCurrentUserName();
    });
  }

  final TextEditingController _controller = TextEditingController();

  bool _isLoading = false;

  void _submitQuestion() async {
    setState(() {
      _isLoading = true;
    });

    final userInput = _controller.text.trim();
    if (userInput.isEmpty) {
      Navigator.pop(context);
      _isLoading = false;
      isResponse = false;
      return;
    }

    await firebases.getResponse(userInput);

    setState(() {
      response = firebases.getResponseMessage();
      _isLoading = false;
      isResponse = true;
    });
    Navigator.pop(context);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    getUser();
    // print(response);
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
                  SecondaryNavigation(title: "My Dashboard"),
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
                      Expanded(
                        child: Cards(
                          image: Image.asset(
                            "assets/images/logo.png",
                            width: 100.0,
                            // height: 50.0,
                            fit: BoxFit.cover,
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, Questiononescreen.id);
                          },
                          title: 'Grow Hair',
                        ),
                      ),
                      Expanded(
                        child: Cards(
                          image: Image.asset(
                            "assets/images/logo.png",
                            width: 100.0,
                          ),
                          onTap: () {},
                          title: 'Stop Hair Loss',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Cards(
                          image: Image.asset(
                            "assets/images/logo.png",
                            width: 100.0,
                            fit: BoxFit.cover,
                          ),
                          onTap: () {},
                          title: 'Stop Breakage',
                        ),
                      ),
                      Expanded(
                        child: Cards(
                          image: Image.asset(
                            "assets/images/logo.png",
                            width: 100.0,
                            fit: BoxFit.cover,
                          ),
                          onTap: () {},
                          title: 'Stop Breakage',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text("Learn"),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor),
                    child: Text("NISH philosophy",
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
