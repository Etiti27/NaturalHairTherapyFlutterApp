import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Methods/Firebase.dart';
import 'package:natural_hair_therapist/Methods/ProviderPackage.dart';
import 'package:natural_hair_therapist/Methods/secondaryNavigation.dart';
import 'package:natural_hair_therapist/Screens/Question.dart';
import 'package:natural_hair_therapist/Widgets/AutocompleteCountry.dart';
import 'package:provider/provider.dart';

import '../Constants.dart';
import '../Methods/BackgroundImage.dart';
import '../Methods/DateOfBirth.dart';
import '../Methods/TextFieldMethod.dart';
import '../Widgets/AppBarWidget.dart';
import '../Widgets/BottomWidget.dart';
import '../Widgets/ButtonWidget.dart';
import 'Login.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});
  static const String id = "registration";

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  late String email;
  late String name;
  late String password;
  late String country;
  late String birthDate;
  late String errorMessage;
  bool isError = false;
  bool isLoading = false;

  FirebaseMethods firebaseMethods = FirebaseMethods();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController countryTextController = TextEditingController();
  TextEditingController dateOfBirthTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final selection = Provider.of<ProviderClass>(context);
    birthDate = selection.getDateOfBirth();
    country = selection.getCountry();

    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ))
              : Container(
                  height: double.infinity,
                  decoration: BackgroundImage(),
                  child: Column(
                    children: [
                      SecondaryNavigation(
                        title: "Registration",
                      ),
                      // const Expanded(
                      //   flex: 1,
                      //   child: Hero(
                      //     tag: "logo",
                      //     child: Image(
                      //       width: 250,
                      //       image: AssetImage("assets/images/logo.png"),
                      //     ),
                      //   ),
                      // ),
                      isError
                          ? Text(
                              errorMessage,
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            )
                          : Text(""),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      Expanded(
                        child: Column(
                          children: [
                            //Name TextField
                            TextFieldMethod(
                              autoFocus: false,
                              hintText: 'Enter Your Name',
                              label: 'Name',
                              suffixIcon: const Icon(
                                Icons.person,
                                color: kPrimaryColor,
                              ),
                              onchanges: (String newName) {
                                setState(() {
                                  name = newName;
                                });
                              },
                              keyboardType: TextInputType.text,
                              textController: nameTextController,
                            ),
                            const SizedBox(
                              height: 5,
                            ),

                            // Email textField
                            TextFieldMethod(
                              autoFocus: false,
                              hintText: "Enter Your Email",
                              label: "E-mail",
                              suffixIcon: const Icon(
                                Icons.email,
                                color: kPrimaryColor,
                              ),
                              onchanges: (newEmail) {
                                setState(() {
                                  email = newEmail;
                                });
                              },
                              keyboardType: TextInputType.emailAddress,
                              textController: emailTextController,
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            TextFieldMethod(
                              autoFocus: false,
                              hintText: "Enter Secret Password",
                              label: "Password",
                              suffixIcon: const Icon(Icons.password_sharp,
                                  color: kPrimaryColor),
                              onchanges: (String newPassword) {
                                setState(() {
                                  password = newPassword;
                                });
                              },
                              keyboardType: TextInputType.text,
                              textController: passwordTextController,
                              obsecure: true,
                            ),

                            const SizedBox(
                              height: 10.0,
                            ),
                            //country
                            AutoCompleteCountries(),
                            const SizedBox(
                              height: 10,
                            ),

                            const DateOfBirthScreen(),

                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FilledButtonWID(
                                  text: const Text("Register"),
                                  onpressed: () async {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    if (nameTextController.text == "" ||
                                        emailTextController.text == "" ||
                                        passwordTextController.text == "" ||
                                        birthDate == "" ||
                                        country == "") {
                                      setState(() {
                                        isLoading = false;
                                        isError = true;
                                        errorMessage =
                                            "None of the field should be null";
                                      });
                                    } else {
                                      print(
                                          "the value is ${nameTextController.text}");
                                      await firebaseMethods.register(
                                        name,
                                        email,
                                        password,
                                        country,
                                        birthDate,
                                      );
                                      if (firebaseMethods.getErrorMessage() !=
                                          "") {
                                        setState(() {
                                          isLoading = false;
                                          nameTextController.clear();
                                          emailTextController.clear();
                                          passwordTextController.clear();
                                          isError = true;
                                          errorMessage =
                                              firebaseMethods.getErrorMessage();
                                        });
                                      } else {
                                        setState(() {
                                          isLoading = false;
                                          isError = false;
                                        });

                                        Navigator.pushReplacementNamed(
                                            context, QAScreen.id);
                                      }
                                    }
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("I already have an account? "),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, Login.id);
                                  },
                                  child: const Text(
                                    "Sign in",
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
        bottomNavigationBar: BottomWidget(),
      ),
    );
  }
}
