import 'package:natural_hair_therapist/Screens/HairCareMaintenance/HairCare.dart';
import 'package:natural_hair_therapist/imports.dart';

class HairCareGrowthMain extends StatefulWidget {
  const HairCareGrowthMain({super.key});
  static const String id = "HairCareGrowthMain";

  @override
  State<HairCareGrowthMain> createState() => _HairCareGrowthMainState();
}

class _HairCareGrowthMainState extends State<HairCareGrowthMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0), // ✅ Adds spacing around content
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // ✅ Centers vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // ✅ Centers horizontally
            children: [
              const Text(
                "Hair Care, Hair Growth, Hair Maintenance",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              // const SizedBox(height: 30),

              // ✅ Equal-sized Cards with Expanded Layout
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: _buildDashboardCard('Hair Care', HairCare.id)),
                  const SizedBox(width: 10),
                  Expanded(child: _buildDashboardCard('Hair Growth', NISH1.id)),
                  const SizedBox(width: 10),
                  Expanded(
                      child: _buildDashboardCard('Hair Maintenance', NISH1.id)),
                ],
              ),

              const SizedBox(height: 30),

              // ✅ Information Card
              Card(
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), // ✅ Smooth edges
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    """Many people think of ‘hair care’ as the products they use. Hair is more than just a product of routines or genetics, and hair care actually starts long before you can even see the hair. 
        
By understanding the unique perspective on hair growth, hair care, and hair maintenance, you’ll gain valuable insights that empower you to make more informed and intentional choices on your hair journey.""",
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }

  // ✅ Helper Function to Build Dashboard Cards with Uniform Sizes
  Widget _buildDashboardCard(String title, String routeName) {
    return DashboardCard(
      icon: const Center(
        child: Icon(Icons.lock_open, color: Colors.white, size: 40.0),
      ),
      image: Image.asset(
        'assets/images/logo.png',
        fit: BoxFit.cover, // ✅ Ensures full coverage
      ),
      title: title,
      OnTap: () {
        Navigator.pushNamed(context, routeName);
      },
    );
  }
}
