import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Screens/Registration.dart';

import '../Constants.dart';
import '../Methods/InputDecoration.dart';
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
  late String Email;
  late String Password;
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
          child: Container(
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
                  height: 20,
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
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (newEmail) {
                          setState(() {
                            Email = newEmail;
                          });
                        },
                        autofocus: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecor(
                          "Enter Your E-mail",
                          "E-mail:",
                          Icon(
                            Icons.email,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onChanged: (newPassword) {
                          setState(() {
                            Password = newPassword;
                          });
                        },
                        obscureText: true,
                        autofocus: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecor(
                          "Enter Your Password",
                          "Password:",
                          Icon(
                            Icons.password,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FilledButtonWID(
                            text: Text("Sign in"),
                            onpressed: () {},
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("I don't have an account yet? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Registration.id);
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
