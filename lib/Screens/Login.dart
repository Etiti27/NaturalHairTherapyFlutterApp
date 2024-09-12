import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Methods/Firebase.dart';
import 'package:natural_hair_therapist/Methods/TextFieldMethod.dart';
import 'package:natural_hair_therapist/Screens/Question.dart';
import 'package:natural_hair_therapist/Screens/Registration.dart';

import '../Constants.dart';
import '../Widgets/AppBarWidget.dart';
import '../Widgets/BottomWidget.dart';
import '../Widgets/ButtonWidget.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const id = 'login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseMethods firebases = FirebaseMethods();
  late String email;
  late String password;
  String errorMessage = "";
  bool isLoading = false;
  bool isError = false;

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(
          logo: const Image(
            image: AssetImage("assets/images/logo.png"),
            color: kPrimaryColor,
          ),
          title: "Sign In",
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                )
              : Container(
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.fill,
                      opacity: 0.3,
                    ),
                  ),
                  child: Column(
                    children: [
                      const Expanded(
                        flex: 3,
                        child: Hero(
                          tag: "logo",
                          child: Image(
                            width: 250,
                            image: AssetImage("assets/images/logo.png"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Expanded(
                        flex: 1,
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: "Roboto-Bold",
                              color: kPrimaryColor),
                        ),
                      ),
                      isError
                          ? Text(
                              errorMessage,
                              style: TextStyle(color: Colors.red),
                            )
                          : Text(""),
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            TextFieldMethod(
                              autoFocus: false,
                              hintText: "Enter Your E-mail",
                              label: "E-mail",
                              suffixIcon: const Icon(
                                Icons.email,
                                color: kPrimaryColor,
                              ),
                              onchanges: (String newEmail) {
                                setState(() {
                                  email = newEmail;
                                });
                              },
                              keyboardType: TextInputType.emailAddress,
                              textController: emailTextController,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFieldMethod(
                              obsecure: true,
                              autoFocus: false,
                              hintText: "Enter Your Password",
                              label: "Password",
                              suffixIcon: const Icon(
                                Icons.password,
                                color: kPrimaryColor,
                              ),
                              onchanges: (String newPassword) {
                                setState(() {
                                  password = newPassword;
                                });
                              },
                              keyboardType: TextInputType.text,
                              textController: passwordTextController,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FilledButtonWID(
                                  text: const Text("Sign in"),
                                  onpressed: () async {
                                    setState(() {
                                      isLoading = true;
                                    });

                                    if (emailTextController.text == "" ||
                                        passwordTextController.text == "") {
                                      setState(() {
                                        isLoading = false;
                                        isError = true;
                                        errorMessage = "There is empty field";
                                      });
                                    } else {
                                      await firebases.signing(
                                          emailTextController.text,
                                          passwordTextController.text);
                                      if (firebases.getErrorMessage() != "") {
                                        setState(() {
                                          isLoading = false;
                                          isError = true;
                                          errorMessage =
                                              firebases.getErrorMessage();
                                        });
                                      } else {
                                        Navigator.pushReplacementNamed(
                                            context, QAScreen.id);
                                        setState(() {
                                          isLoading = false;
                                        });
                                      }
                                    }

                                    emailTextController.clear();
                                    passwordTextController.clear();
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("I don't have an account yet? "),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Registration.id);
                                  },
                                  child: const Text(
                                    "Register",
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
