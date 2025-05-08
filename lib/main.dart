import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:natural_hair_therapist/Screens/Dashboards/Dashboard3.dart';
import 'package:natural_hair_therapist/Screens/GrowHair/GrowYourHair6.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/HairMain/HairMaint1.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/HairMain/HairMaint3.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Nutriton/NISH5.dart';

import 'Screens/Questions/7Question.dart';
import 'Screens/UnderstandingNISH/HairMain/HairMaint2.dart';
import 'Screens/UnderstandingNISH/HairMain/HairMaint4.dart';
import 'Screens/UnderstandingNISH/Ingredient/Ingredient4b.dart';
import 'Screens/UnderstandingNISH/Ingredient/Ingredient5a.dart';
import 'Screens/UnderstandingNISH/Nutriton/NISH1.dart';
import 'imports.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   await FirebaseAppCheck.instance.activate(
//     androidProvider: AndroidProvider.debug, // or playIntegrity
//     appleProvider: AppleProvider.debug, // or appAttest/deviceCheck
//   );
//
//   runApp(MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures binding is initialized
  // await NotificationService.init();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug, // or playIntegrity
    appleProvider: AppleProvider.debug, // or appAttest/deviceCheck
  );
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
        Dashboard2.id: (context) => const Dashboard2(),
        Dashboard3.id: (context) => const Dashboard3(),
        Growyourhair.id: (context) => const Growyourhair(),
        QuestionScreen.id: (context) => QuestionScreen(),
        Questiononescreen.id: (context) => const Questiononescreen(),
        Questiontwoscreen.id: (context) => const Questiontwoscreen(),
        Questionthreescreen.id: (context) => const Questionthreescreen(),
        Question2.id: (context) => const Question2(),
        Question3.id: (context) => const Question3(),
        Question4.id: (context) => const Question4(),
        Question5.id: (context) => Question5(),
        Question6.id: (context) => const Question6(),
        Question7.id: (context) => Question7(),
        Question8.id: (context) => const Question8(),
        Question9.id: (context) => const Question9(),
        Question10.id: (context) => const Question10(),
        Growyourhair.id: (context) => const Growyourhair(),
        Growyourhair2.id: (context) => const Growyourhair2(),
        Growyourhair3.id: (context) => const Growyourhair3(),
        Growyourhair4.id: (context) => const Growyourhair4(),
        Growyourhair5.id: (context) => const Growyourhair5(),
        Growyourhair6.id: (context) => const Growyourhair6(),
        ResultScreen.id: (context) => ResultScreen(),
        IntroNISH.id: (context) => const IntroNISH(),
        NISH1.id: (context) => const NISH1(),
        NISH2.id: (context) => const NISH2(),
        NISH3.id: (context) => const NISH3(),
        NISH4.id: (context) => const NISH4(),
        NISH5.id: (context) => const NISH5(),
        Ingredient.id: (context) => const Ingredient(),
        Ingredient2.id: (context) => const Ingredient2(),
        Ingredient3.id: (context) => const Ingredient3(),
        Ingredient4.id: (context) => const Ingredient4(),
        Ingredient4.id: (context) => const Ingredient4(),
        Ingredient4b.id: (context) => const Ingredient4b(),
        Ingredient5.id: (context) => const Ingredient5(),
        Ingredient5a.id: (context) => Ingredient5a(),
        Ingredient6.id: (context) => const Ingredient6(),
        Ingredient7.id: (context) => const Ingredient7(),
        Scalp1.id: (context) => const Scalp1(),
        scalp2.id: (context) => const scalp2(),
        scalp3.id: (context) => const scalp3(),
        scalp4.id: (context) => const scalp4(),
        stress1.id: (context) => const stress1(),
        stress2.id: (context) => const stress2(),
        stress3.id: (context) => const stress3(),
        stress4.id: (context) => const stress4(),
        stress5.id: (context) => const stress5(),
        sleep1.id: (context) => const sleep1(),
        sleep2.id: (context) => const sleep2(),
        sleep3.id: (context) => const sleep3(),
        sleep4.id: (context) => const sleep4(),
        sleep5.id: (context) => const sleep5(),
        hairMaint1.id: (context) => const hairMaint1(),
        hairMaint2.id: (context) => const hairMaint2(),
        hairMaint3.id: (context) => const hairMaint3(),
        HairMaint4.id: (context) => const HairMaint4(),
        lengthlent1.id: (context) => const lengthlent1(),
        lengthlent2.id: (context) => const lengthlent2(),
        HairCareGrowthMain.id: (context) => const HairCareGrowthMain(),
        HairCare.id: (context) => const HairCare(),
        HairGrowth.id: (context) => const HairGrowth(),
        HairGrowth2.id: (context) => const HairGrowth2(),
        HairMaintenance.id: (context) => const HairMaintenance(),
        HairMaintenance2.id: (context) => const HairMaintenance2(),
        HairMaintenance3.id: (context) => const HairMaintenance3(),
        EndOfNish.id: (context) => const EndOfNish(),
      },
    );
  }
}
