import 'package:natural_hair_therapist/imports.dart';

// Function to show the sliding modal
void HairMaintQuickTip(BuildContext context) {
  int currentStep = 1;
  int totalSteps = 4;

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
            String title =
                "Retention is protection. Don’t let your ends suffer";
            // Function to build the flip card for each step
            Widget buildSlidingCard(int step) {
              switch (step) {
                case 1:
                  return _buildCard(
                    title: title,
                    description:
                        "Hair maintenance is a lifestyle, not an event.",
                  );
                case 2:
                  return _buildCard(
                    title: title,
                    description: "Wrap it up. Your hair needs rest too.",
                  );
                case 3:
                  return _buildCard(
                      title: title,
                      description: "Be gentle. Hair strands are precious.");
                case 4:
                  return _buildCard(
                      title: title,
                      description:
                          "It’s not what you use—it’s what you consistently do.");

                default:
                  return const Center(
                    child: Text('You have completed the steps!'),
                  );
              }
            }

            // Automatically animate the sliding effect after a delay
            Future.delayed(const Duration(seconds: 4), () {
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
