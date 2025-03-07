import 'package:natural_hair_therapist/Screens/HairCareGrowthMain.dart';
import 'package:natural_hair_therapist/imports.dart';

class Dashboard2 extends StatefulWidget {
  const Dashboard2({super.key});
  static const String id = "dashboard2";

  @override
  State<Dashboard2> createState() => _Dashboard2State();
}

class _Dashboard2State extends State<Dashboard2> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final questionnaire = Provider.of<ProviderClass>(context, listen: false);
      final emails = questionnaire.getEmail();
      checkedd(emails);
    });
    // userInfo();
  }

  Future<Map<String, dynamic>> userInfo(emailw) async {
    DatabaseService infor = DatabaseService();
    List<Map<String, dynamic>> infors = await infor.fetchUsers(emailw);
    infor.closeConnection();
    return infors[0];
  }

  bool isNishDone = true;
  bool isHairCare = false;
  bool is3step = false;
  // final String? courseName =
  //     ModalRoute.of(context)!.settings.arguments as String?;

  // userInfo(emails);
  Future<void> checkedd(emaild) async {
    dynamic userDone = await userInfo(emaild);
    bool nish = userDone["isnishdone"];
    bool hairCare = userDone["ishaircaredone"];
    bool threeStep = userDone["is3stepdone"];

    setState(() {
      isNishDone = nish;
      isHairCare = hairCare;
      is3step = threeStep;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // ✅ Center content vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // ✅ Center content horizontally
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DashboardCard(
                  icon: iconLock(isDone: isNishDone),
                  image: Image.asset(
                    'assets/images/logo.png',
                    width: 100.0,
                    // height: 50.0,
                    fit: BoxFit.cover,
                  ),
                  title: 'Understanding NISH',
                  OnTap: () {
                    isNishDone ? Navigator.pushNamed(context, NISH1.id) : null;
                  },
                ),
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DashboardCard(
                  icon: iconLock(isDone: isHairCare),
                  image: Image.asset(
                    'assets/images/logo.png',
                    width: 100.0,
                    // height: 50.0,
                    fit: BoxFit.cover,
                  ),
                  title: 'Hair Care,\n'
                      'Hair Growth, \n'
                      'Hair Maintenance',
                  OnTap: () {
                    isHairCare
                        ? Navigator.pushNamed(context, HairCareGrowthMain.id)
                        : null;
                  },
                ),
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DashboardCard(
                  icon: iconLock(isDone: is3step),
                  image: Image.asset(
                    'assets/images/logo.png',
                    width: 100.0,
                    // height: 50.0,
                    fit: BoxFit.cover,
                  ),
                  title: '3 steps to grow Better Hair',
                  OnTap: () {},
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}

class iconLock extends StatelessWidget {
  const iconLock({
    super.key,
    required this.isDone,
  });

  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: !isDone
            ? Image.asset(
                "assets/images/lock.gif",
                width: 70,
              )
            : Image.asset(
                "assets/images/unlock.gif",
                width: 70,
              ));
  }
}
