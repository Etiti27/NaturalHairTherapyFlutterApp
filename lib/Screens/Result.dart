import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Screens/Dashboard2.dart';
import 'package:natural_hair_therapist/Widgets/AppBarWidget.dart';
import 'package:natural_hair_therapist/Widgets/BottomWidget.dart';
import 'package:provider/provider.dart';

import '../Constants.dart';
import '../Methods/BackgroundImage.dart';
import '../Methods/ProviderPackage.dart';
import '../Methods/QuestionBank.dart';
import '../Methods/secondaryNavigation.dart';
// import 'openai_service.dart'; // Ensure this is the correct file path

class ResultScreen extends StatefulWidget {
  static const String id = "Result";
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   fetchResponse(in);
  //   print(responseText);
  // }

  List<String> users = ["obinna", "how"];
  // int index = 1;
  final Map<String, String> _questions = QuestionBank().getQuestion();

  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    String? response = questionnaire.getResponse();
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    String responseText = args["responseText"];

    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: Container(
          // height: double.infinity,
          decoration: BackgroundImage(),
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SecondaryNavigation(
                    title: "Result",
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Card(
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    // Shadow effect

                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Text(responseText),
                              Text(
                                "Great job! 🎉 Your responses have been recorded, and your personalized report has been emailed to you. Make sure to check your inbox for insights and recommendations based on your answers. If you don’t see the email, kindly check your spam folder or contact support for assistance",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor),
                      onPressed: () {
                        Navigator.pushNamed(context, Dashboard2.id);
                      },
                      child: const Text(
                        "Start Your Education",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
