import 'package:natural_hair_therapist/imports.dart';

class HairCareGrowthMain extends StatefulWidget {
  const HairCareGrowthMain({super.key});
  static const String id = "HairCareGrowthMain";

  @override
  State<HairCareGrowthMain> createState() => _HairCareGrowthMainState();
}

class _HairCareGrowthMainState extends State<HairCareGrowthMain> {
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
        child: Column(
          children: [
            const Text(
              "Hair Care, Hair Growth, Hair Maintenance",
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Flexible(
                          child: DashboardCard(
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
                            title: 'Hair Care',
                            OnTap: () {
                              Navigator.pushNamed(context, NISH1.id);
                            },
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Flexible(
                          child: DashboardCard(
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
                            title: 'Hair Growth',
                            OnTap: () {
                              Navigator.pushNamed(context, NISH1.id);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Flexible(
                          child: DashboardCard(
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
                            title: 'Hair Maintenance',
                            OnTap: () {
                              Navigator.pushNamed(context, NISH1.id);
                            },
                          ),
                        ),
                      ),

                      // const SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            const Card(
              color: kPrimaryColor,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  textAlign: TextAlign.justify,
                  """Many people think of ‘hair care’ as the products they use.  Hair is more than just a product of routines or genetics, and hair care actually starts long before you can even see the hair. 
                    
By understanding the unique perspective on hair growth, hair care, and hair maintenance, you’ll gain valuable insights that empower you to make more informed and intentional choices on your hair journey.
            """,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
