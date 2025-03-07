import 'package:natural_hair_therapist/Screens/HairCareGrowthMain.dart';
import 'package:natural_hair_therapist/Screens/HairCareMaintenance/HairCare.dart';
import 'package:natural_hair_therapist/Screens/HairCareMaintenance/HairGrowth.dart';
import 'package:natural_hair_therapist/Screens/HairCareMaintenance/HairGrowth2.dart';
import 'package:natural_hair_therapist/Screens/HairCareMaintenance/HairMaintenance.dart';
import 'package:natural_hair_therapist/Screens/HairCareMaintenance/HairMaintenance2.dart';
import 'package:natural_hair_therapist/Screens/HairCareMaintenance/HairMaintenance3.dart';
import 'package:natural_hair_therapist/Screens/endOfNISH.dart';

import 'imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures binding is initialized
  // await NotificationService.init();
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
        Dashboard2.id: (context) => const Dashboard2(),
        Growyourhair.id: (context) => const Growyourhair(),
        QuestionScreen.id: (context) => QuestionScreen(),
        Questiononescreen.id: (context) => Questiononescreen(),
        Questiontwoscreen.id: (context) => const Questiontwoscreen(),
        Questionthreescreen.id: (context) => const Questionthreescreen(),
        Question2.id: (context) => const Question2(),
        Question3.id: (context) => Question3(),
        Question4.id: (context) => Question4(),
        Question5.id: (context) => Question5(),
        Question6.id: (context) => Question6(),
        Question7.id: (context) => Question7(),
        Question8.id: (context) => Question8(),
        Question9.id: (context) => Question9(),
        Growyourhair.id: (context) => Growyourhair(),
        Growyourhair2.id: (context) => Growyourhair2(),
        Growyourhair3.id: (context) => Growyourhair3(),
        Growyourhair4.id: (context) => Growyourhair4(),
        ResultScreen.id: (context) => ResultScreen(),
        NISH1.id: (context) => NISH1(),
        NISH2.id: (context) => NISH2(),
        NISH3.id: (context) => NISH3(),
        NISH4.id: (context) => NISH4(),
        Ingredient.id: (context) => Ingredient(),
        Ingredient2.id: (context) => Ingredient2(),
        Ingredient3.id: (context) => Ingredient3(),
        Ingredient4.id: (context) => Ingredient4(),
        Ingredient5.id: (context) => Ingredient5(),
        Ingredient6.id: (context) => Ingredient6(),
        Ingredient7.id: (context) => Ingredient7(),
        scalp1.id: (context) => scalp1(),
        scalp2.id: (context) => scalp2(),
        scalp3.id: (context) => scalp3(),
        scalp4.id: (context) => scalp4(),
        stress1.id: (context) => stress1(),
        stress2.id: (context) => stress2(),
        stress3.id: (context) => stress3(),
        stress4.id: (context) => stress4(),
        stress5.id: (context) => stress5(),
        sleep1.id: (context) => sleep1(),
        sleep2.id: (context) => sleep2(),
        sleep3.id: (context) => sleep3(),
        sleep4.id: (context) => sleep4(),
        sleep5.id: (context) => sleep5(),
        hairMain1.id: (context) => hairMain1(),
        hairMain2.id: (context) => hairMain2(),
        hairMain3.id: (context) => hairMain3(),
        lengthlent1.id: (context) => lengthlent1(),
        lengthlent2.id: (context) => lengthlent2(),
        HairCareGrowthMain.id: (context) => HairCareGrowthMain(),
        HairCare.id: (context) => HairCare(),
        HairGrowth.id: (context) => HairGrowth(),
        HairGrowth2.id: (context) => HairGrowth2(),
        HairMaintenance.id: (context) => HairMaintenance(),
        HairMaintenance2.id: (context) => HairMaintenance2(),
        HairMaintenance3.id: (context) => HairMaintenance3(),
        EndOfNish.id: (context) => EndOfNish(),
      },
    );
  }
}
