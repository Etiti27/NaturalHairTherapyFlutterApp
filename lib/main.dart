import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Screens/Registration.dart';

import 'Screens/Home.dart';
import 'Screens/Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Login.id,
      routes: {
        Home.id: (context) => const Home(),
        Login.id: (context) => const Login(),
        Registration.id: (context) => const Registration()
      },
    );
  }
}
