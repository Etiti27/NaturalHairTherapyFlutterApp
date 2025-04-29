import 'package:natural_hair_therapist/imports.dart';

// Function to show the sliding modal
void showSlidingModal(BuildContext context) {
  int currentStep = 1;
  int totalSteps = 6;

  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Modal Barrier',
    transitionDuration: Duration(milliseconds: 1000),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Align(
        alignment: Alignment.centerLeft, // Modal will come from the left
        child: StatefulBuilder(
          builder: (context, setState) {
            // Function to build the flip card for each step
            Widget buildSlidingCard(int step) {
              switch (step) {
                case 1:
                  return _buildCard(
                      title: "Understand Ingredients",
                      description:
                          "Don’t fall for the label—read the ingredients");
                case 2:
                  return _buildCard(
                      title: "Personalize Your Routine",
                      description:
                          "Avoid copying someone else’s product list. Start with your own hair need.");
                case 3:
                  return _buildCard(
                      title: "Choose Fatty Alcohols",
                      description:
                          "Fatty alcohols are your friends—drying alcohols, not so much.");
                case 4:
                  return _buildCard(
                      title: "Silicones",
                      description:
                          "Silicones aren’t evil—they’re a great barrier when used mindfully.");
                case 5:
                  return _buildCard(
                      title: "Purposeful Products",
                      description:
                          "Every product has a purpose—but not every product has a place in your routine");
                case 6:
                  return _buildCard(
                      title: "Be Intentional",
                      description:
                          "Don’t Buy Blindly: Avoid the “hope it works” approach. Instead, choose products based on the ingredients that fit your hair’s specific needs.");
                default:
                  return Center(
                    child: Text('You have completed the steps!'),
                  );
              }
            }

            // Automatically animate the sliding effect after a delay
            Future.delayed(Duration(seconds: 4), () {
              setState(() {
                currentStep = currentStep < totalSteps
                    ? currentStep + 1
                    : currentStep = 1;
              });
            });

            return SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Animated sliding card
                    TweenAnimationBuilder(
                      duration: const Duration(seconds: 4),
                      tween: Tween<Offset>(
                        begin: Offset(-1.0, 0.0), // Start off-screen
                        end: Offset(0.0, 0.0), // End at the center
                      ),
                      builder: (context, offset, child) {
                        return Transform.translate(
                          offset: offset,
                          child: child,
                        );
                      },
                      child:
                          buildSlidingCard(currentStep), // The current content
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: currentStep > 1
                              ? () => setState(() => currentStep--)
                              : null,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: kPrimaryColor,
                          ),
                          child: const Text("<< Prev"),
                        ),
                        ElevatedButton(
                          onPressed: currentStep < totalSteps
                              ? () => setState(() => currentStep++)
                              : () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: kPrimaryColor,
                          ),
                          child: Text(
                              currentStep < totalSteps ? "Next >>" : "Close"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0); // Modal slides from the left
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}

// Widget to build the front of each flip card
Widget _buildCard({required String title, required String description}) {
  return Card(
    elevation: 6,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    ),
  );
}
