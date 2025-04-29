import 'package:flip_card/flip_card.dart';

import '../../../../imports.dart';
import '../classesInsideNutrition/NutritionMode.dart';
import '../flipcard/flipcard.dart';

void showSideModal2(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
  bool isLandscape = screenWidth > screenHeight;

  int totalSteps = 6; // total number of flip cards
  int currentStep = 1;

  showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) {
      return Align(
        alignment: Alignment.center,
        child: StatefulBuilder(
          builder: (context, setState) {
            Widget buildFlipCard(int step) {
              switch (step) {
                case 1:
                  return FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    speed: 500,
                    front: buildFrontCard(
                      title: "Protein 🥚",
                      sources:
                          "\nSources: Eggs, chicken, lentils, chickpeas, Greek yogurt, fish, tofu.",
                    ),
                    back: buildBackCard(
                      description:
                          "Protein is the main component of your hair. Hair strands are made of a protein called keratin. Without enough protein in your diet, your hair becomes weak, dry, and more prone to breakage.",
                      tip:
                          "Quick Tip:\nAdd a protein source to every meal—even a boiled egg or a handful of nuts counts!",
                    ),
                  );

                case 2:
                  return FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    speed: 500,
                    front: buildFrontCard(
                      title: "Iron & Zinc 🥩",
                      sources:
                          "\nSources: Red meat, pumpkin seeds, spinach, quinoa, shellfish, beans.",
                    ),
                    back: buildBackCard(
                      description:
                          "Iron helps carry oxygen in your blood. Zinc supports cell growth and repair, including the cells that build your hair.Low iron can lead to hair shedding or slow growth. Zinc deficiency may weaken the hair shaft and scalp, leading to thinning or flaking.",
                      tip:
                          "Quick Tip:\nPair iron-rich foods with vitamin C (like oranges) to boost absorption!",
                    ),
                  );

                case 3:
                  return FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    speed: 500,
                    front: buildFrontCard(
                      title: "Vitamin C 🥦",
                      sources:
                          "\nSources: Whole grains, eggs, avocados, almonds, leafy greens.",
                    ),
                    back: buildBackCard(
                      description:
                          "B-complex vitamins help your body create energy and new cells—including hair cells. Biotin is especially known for supporting hair strength.Without B vitamins, hair may grow more slowly, or strands may become thinner or weaker.",
                      tip:
                          "Quick Tip:\nB vitamins are water-soluble, so they’re not stored in the body—eat them daily!",
                    ),
                  );
                case 4:
                  return FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    speed: 500,
                    front: buildFrontCard(
                      title: "Omega-3 🐟",
                      sources:
                          "\nSources: Salmon, sardines, walnuts, flax seeds, chia seeds.",
                    ),
                    back: buildBackCard(
                      description:
                          "Healthy fats that reduce inflammation and help keep the scalp hydrated.A dry, flaky, or inflamed scalp can disrupt hair growth. Omega-3s support the skin barrier and keep your scalp’s environment balanced.",
                      tip:
                          "Quick Tip:\nNot into fish? Try adding a tablespoon of ground flaxseed to your breakfast.",
                    ),
                  );
                case 5:
                  return FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    speed: 500,
                    front: buildFrontCard(
                      title: "Vitamin C 🍊",
                      sources:
                          "\nSources: Citrus fruits, strawberries, bell peppers, broccoli, kiwi.",
                    ),
                    back: buildBackCard(
                      description:
                          "A powerful antioxidant that helps your body absorb iron and build collagen (a protein needed for healthy hair structure).Low vitamin C means your body can’t absorb enough iron—even if you’re eating it. This can lead to weak strands or shedding.",
                      tip:
                          "Quick Tip:\nAdd fresh fruit to your snacks or breakfast for an easy vitamin C boost.",
                    ),
                  );
                case 6:
                  return FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    speed: 500,
                    front: buildFrontCard(
                      title: """Water 
💧""",
                      sources:
                          "\nSources: Water, herbal teas, fruits like cucumber, watermelon, oranges.",
                    ),
                    back: buildBackCard(
                      description:
                          "Hydration supports every cell function in your body—including the cells in your scalp and hair follicles.Dehydration can make hair dry, brittle, and more prone to breakage. It also slows down the delivery of nutrients to the scalp.",
                      tip:
                          "Quick Tip:\nSip water consistently throughout the day instead of all at once. Your hair loves hydration from the inside out",
                    ),
                  );

                default:
                  return Card(
                    color: kPrimaryColor,
                    child: NutritionModal(
                      text1:
                          'You have successfully completed the "The Building Blocks" section',
                      text2:
                          'You can now close this and go to next page (The Gut Health)',
                    ),
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
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: isLandscape
                              ? screenHeight * 0.5
                              : screenHeight * 0.5,
                          minWidth: screenWidth * 0.8,
                        ),
                        child: buildFlipCard(currentStep),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: currentStep > 1
                              ? () => setState(() => currentStep--)
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: kPrimaryColor,
                          ),
                          child: const Text("<< Prev"),
                        ),
                        ElevatedButton(
                          onPressed: currentStep < totalSteps + 1
                              ? () => setState(() => currentStep++)
                              : () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: kPrimaryColor,
                          ),
                          child: Text(currentStep < totalSteps + 1
                              ? "Next >>"
                              : "Close"),
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
