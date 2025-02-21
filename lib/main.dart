import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:natural_hair_therapist/Screens/2Question.dart';
import 'package:natural_hair_therapist/Screens/3Question.dart';
import 'package:natural_hair_therapist/Screens/Dashboard.dart';
import 'package:natural_hair_therapist/Screens/GrowYourHair.dart';
import 'package:natural_hair_therapist/Screens/QuestionThreeScreen.dart';
import 'package:natural_hair_therapist/Screens/QuestionTwoScreen.dart';
import 'package:natural_hair_therapist/Screens/Registration.dart';
import 'package:natural_hair_therapist/Screens/question_one.dart';
import 'package:natural_hair_therapist/Screens/test.dart';
import 'package:provider/provider.dart';

import 'Methods/ProviderPackage.dart';
import 'Screens/4Question.dart';
import 'Screens/5Question.dart';
import 'Screens/6Question.dart';
import 'Screens/7Question.dart';
import 'Screens/8Question.dart';
import 'Screens/9Question.dart';
import 'Screens/Home.dart';
import 'Screens/Login.dart';
import 'Screens/Result.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures binding is initialized
  await dotenv.load(fileName: ".env");
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
        Dashboard.id: (context) => const Dashboard(),
        Growyourhair.id: (context) => const Growyourhair(),
        QuestionScreen.id: (context) => QuestionScreen(),
        Questiononescreen.id: (context) => Questiononescreen(),
        Questiontwoscreen.id: (context) => const Questiontwoscreen(),
        Questionthreescreen.id: (context) => const Questionthreescreen(),
        Question2.id: (context) => const Question2(),
        Question3.id: (context) => Question3(),
        Question4.id: (context) => Question4(),
        Question5.id: (context) => const Question5(),
        Question6.id: (context) => const Question6(),
        Question7.id: (context) => const Question7(),
        Question8.id: (context) => const Question8(),
        Question9.id: (context) => const Question9(),
        Growyourhair.id: (context) => const Growyourhair(),
        ChatScreen.id: (context) => ChatScreen()
      },
    );
  }
}
