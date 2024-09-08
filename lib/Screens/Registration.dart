import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Widgets/AutocompleteCountry.dart';

import '../Constants.dart';
import '../Methods/DateOfBirth.dart';
import '../Methods/InputDecoration.dart';
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
  late String email;
  late String name;
  late String password;
  late String country;
  late String birthDate;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(
          logo: const Image(
            image: AssetImage("assets/images/logo.png"),
            color: kPrimaryColor,
          ),
          title: "Registration",
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
                  flex: 1,
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
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      //Name
                      TextField(
                        onChanged: (newName) {
                          setState(() {
                            name = newName;
                          });
                        },
                        autofocus: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecor(
                          "Enter Your Name",
                          "Name:",
                          const Icon(
                            Icons.person,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      //E-MAIL
                      TextField(
                        onChanged: (newEmail) {
                          setState(() {
                            email = newEmail;
                          });
                        },
                        autofocus: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecor(
                          "Enter Your E-mail",
                          "E-mail:",
                          const Icon(
                            Icons.email,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      //password
                      TextField(
                        onChanged: (newPassword) {
                          setState(() {
                            password = newPassword;
                          });
                        },
                        obscureText: true,
                        autofocus: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecor(
                            "Enter Your Password",
                            "Password:",
                            const Icon(
                              Icons.password,
                              color: kPrimaryColor,
                            )),
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
                            onpressed: () {},
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
    ;
  }
}
