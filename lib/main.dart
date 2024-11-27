import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:natural_hair_therapist/Screens/Dashboard.dart';
import 'package:natural_hair_therapist/Screens/GrowYourHair.dart';
import 'package:natural_hair_therapist/Screens/QuestionOneScreen.dart';
import 'package:natural_hair_therapist/Screens/QuestionTwoScreen.dart';
import 'package:natural_hair_therapist/Screens/Registration.dart';
import 'package:natural_hair_therapist/Screens/test.dart';
import 'package:provider/provider.dart';

import 'Methods/ProviderPackage.dart';
import 'Screens/Home.dart';
import 'Screens/Login.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized(); // Ensures binding is initialized
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProviderClass(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => const Home(),
        Login.id: (context) => const Login(),
        Registration.id: (context) => const Registration(),
        QAScreen.id: (context) => const QAScreen(),
        Growyourhair.id: (context) => const Growyourhair(),
        QuestionScreen.id: (context) => QuestionScreen(),
        Questiononescreen.id: (context) => Questiononescreen(),
        Questiontwoscreen.id: (context) => Questiontwoscreen()
      },
    );
  }
}
