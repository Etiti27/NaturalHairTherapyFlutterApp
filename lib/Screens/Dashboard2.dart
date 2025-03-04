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
  }

  @override
  final List<String> imageList = ["assets/images/logo.png"];

  bool isFirstDone = false;
  bool isSecondDone = false;
  bool isThirdDone = false;

  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);

    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // ✅ Center content vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // ✅ Center content horizontally
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // ✅ Center items in Row
                children: [
                  DashboardCard(
                    icon: const Center(
                      child: Icon(
                        Icons.lock_open,
                        color: Colors.white,
                        size: 40.0,
                      ),
                    ),
                    image: Image.asset(
                      'assets/images/logo.png',
                      width: 100.0,
                      // height: 50.0,
                      fit: BoxFit.cover,
                    ),
                    title: 'Understanding NISH',
                    OnTap: () {
                      Navigator.pushNamed(context, NISH1.id);
                    },
                  ),
                  const SizedBox(width: 10), // ✅ Add spacing between cards
                ],
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // ✅ Center items in Row
                children: [
                  DashboardCard(
                    icon: Center(
                      child: !isFirstDone
                          ? const Icon(
                              Icons.lock_outline,
                              color: Colors.white,
                              size: 40.0,
                            )
                          : const Icon(
                              Icons.lock_open,
                              color: Colors.white,
                              size: 40.0,
                            ),
                    ),
                    image: Image.asset(
                      'assets/images/logo.png',
                      width: 100.0,
                      // height: 50.0,
                      fit: BoxFit.cover,
                    ),
                    title: 'Hair Care, Hair Growth, Hair Maintenance',
                    OnTap: () {
                      Navigator.pushNamed(context, HairCareGrowthMain.id);
                    },
                  ),
                  const SizedBox(width: 10), // ✅ Add spacing between cards
                ],
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // ✅ Center items in Row
                children: [
                  DashboardCard(
                    icon: Center(
                      child: !isFirstDone
                          ? const Icon(
                              Icons.lock_outline,
                              color: Colors.white,
                              size: 40.0,
                            )
                          : const Icon(
                              Icons.lock_open,
                              color: Colors.white,
                              size: 40.0,
                            ),
                    ),
                    image: Image.asset(
                      'assets/images/logo.png',
                      width: 100.0,
                      // height: 50.0,
                      fit: BoxFit.cover,
                    ),
                    title: '3 steps to grow Better Hair',
                    OnTap: () {},
                  ),
                  const SizedBox(width: 10), // ✅ Add spacing between cards
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
