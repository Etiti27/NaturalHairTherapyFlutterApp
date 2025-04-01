import 'package:natural_hair_therapist/imports.dart';

class Dashboard3 extends StatefulWidget {
  const Dashboard3({super.key});
  static const String id = "dashboard3";

  @override
  State<Dashboard3> createState() => _Dashboard3State();
}

class _Dashboard3State extends State<Dashboard3> {
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
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // ✅ Center content vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // ✅ Center content horizontally
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DashboardCard(
                        icon: iconLock(isDone: isNishDone),
                        title: 'Start Your Education',
                        OnTap: () {
                          isNishDone
                              ? Navigator.pushNamed(context, Dashboard2.id)
                              : null;
                        },
                      ),
                    ),
                  ),
                  // const SizedBox(width: 10),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DashboardCard(
                        icon: iconLock(isDone: isHairCare),
                        title: 'Start My Action Plan',
                        OnTap: () {
                          isHairCare
                              ? Navigator.pushNamed(
                                  context, HairCareGrowthMain.id)
                              : null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DashboardCard(
                        icon: iconLock(isDone: is3step),
                        title: """Track My Progress & Set Reminder""",
                        OnTap: () {},
                      ),
                    ),
                  ),
                  // const SizedBox(width: 10),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DashboardCard(
                        icon: iconLock(isDone: is3step),
                        title: 'My Goal Summary',
                        OnTap: () {},
                      ),
                    ),
                  ),
                ],
              )
              // const SizedBox(width: 10),
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
