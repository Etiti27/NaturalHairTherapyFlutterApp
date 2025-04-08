import '../../../imports.dart';
import 'NISH1.dart';

void _showSideModal(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
  bool isLandscape = screenWidth > screenHeight;

  int currentStep = 1;
  int numberofPage = 7;

  showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) {
      return Align(
        alignment: Alignment.center,
        child: StatefulBuilder(
          builder: (context, setState) {
            Widget _buildStepContent(int step) {
              switch (step) {
                case 1:
                  return NutritionModal(
                    text1: 'Why Nutrition Is Important for Hair',
                    text2:
                        'Hair growth is a natural function of the body. Just like your heart beats and your lungs breathe, your body knows how to grow hair — but it needs the right tools to do the job well.',
                  );
                case 2:
                  return NutritionModal(
                    text1: 'Those tools are called',
                    text3: const Text(
                      "NUTRIENTS",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  );
                case 3:
                  return NutritionModal(
                    text1: 'Hair is made up of a tough protein called keratin',
                    text2:
                        'To produce strong, healthy strands, your body needs a steady supply of building blocks like protein, vitamins, and minerals.',
                  );
                case 4:
                  return NutritionModal(
                    text2:
                        'If your nutrition is poor, your body will focus its energy on more vital organs first — and your hair will be the first to show signs of weakness.',
                  );
                case 5:
                  return NutritionModal(
                    text2:
                        'That’s why dry, brittle, or thinning hair is often a sign that your body isn’t getting enough of what it needs.',
                  );
                case 6:
                  return NutritionModal(
                    text2:
                        'But nutrition doesn’t stop with what you eat — it also includes how well your body absorbs those nutrients. This is why gut health is just as important. A well-functioning digestive system helps your body take in and use the goodness you give it.',
                  );
                case 7:
                  return NutritionModal(
                    text2:
                        'If you want healthy hair, you have to start from the inside.That’s why, in the NIS³H framework, Nutrition comes first.',
                  );
                default:
                  return NutritionModal(
                    text1:
                        'You have successfully completed the Introduction section',
                    text2:
                        'You can now close this and go to next page (Building block)',
                  );
              }
            }

            return SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    opacity: 0.2,
                    image: AssetImage('assets/images/nii.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: isLandscape
                              ? screenHeight * 0.5
                              : screenHeight * 0.5,
                        ),
                        child: Card(
                          color: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Center(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    _buildStepContent(currentStep),
                                    const SizedBox(height: 30),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                          onPressed: currentStep > 1
                                              ? () => setState(() {
                                                    currentStep--;
                                                  })
                                              : null,
                                          child: const Text("<< prev"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            if (currentStep <
                                                numberofPage + 1) {
                                              setState(() {
                                                currentStep++;
                                              });
                                            } else {
                                              Navigator.pop(context);
                                            }
                                          },
                                          child: Text(
                                              currentStep < numberofPage + 1
                                                  ? "next >>"
                                                  : "close"),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
    barrierDismissible: true,
    barrierLabel: 'Modal Barrier',
    transitionDuration: const Duration(milliseconds: 500),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}
