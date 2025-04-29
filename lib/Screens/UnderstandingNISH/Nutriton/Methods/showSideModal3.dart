import 'package:flip_card/flip_card.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Nutriton/Methods/showModalBottomSheet.dart';

import '../../../../imports.dart';
import '../classesInsideNutrition/NutritionMode.dart';
import '../flipcard/flipcard.dart';

void showSideModal3(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
  bool isLandscape = screenWidth > screenHeight;

  int totalSteps = 7; // total number of flip cards
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
                  return Card(
                    color: kPrimaryColor,
                    child: NutritionModal(
                      text1: 'Gut Health = Hair Health',
                      text2: 'What Happens in Your Gut Shows Up in Your Hair',
                    ),
                  );

                case 2:
                  return Card(
                    color: kPrimaryColor,
                    child: NutritionModal(
                      text2:
                          'We often talk about what to eat for hair health, but very few people talk about how well your body is absorbing what you eat. You can eat all the right foods, but if your gut isn’t functioning properly, those nutrients may never reach your hair follicles.',
                    ),
                  );

                case 3:
                  return Card(
                    color: kPrimaryColor,
                    child: NutritionModal(
                      text2:
                          'That’s why gut health is a vital part of the Nutrition pillar in ',
                      text3: const Text(
                        "NIS³H",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w900,
                            fontSize: 70),
                      ),
                    ),
                  );
                case 4:
                  return Card(
                    color: kPrimaryColor,
                    child: NutritionModal(
                      text2:
                          'Your gut is where vitamins, minerals, and proteins are broken down and absorbed into your bloodstream. It’s also where inflammation can begin—especially if your gut lining is compromised or your microbiome (the bacteria living in your gut) is out of balance. If your gut isn’t happy, your hair won’t be either.',
                    ),
                  );
                case 5:
                  return FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    speed: 500,
                    front: buildFrontCard(
                      title: "🌱 Prebiotics",
                      sources:
                          "\nSources: Garlic, onions, oats, asparagus, leeks, apples.",
                    ),
                    back: buildBackCard(
                      description:
                          "Prebiotics are plant fibers that feed the healthy bacteria in your gut. A well-fed gut microbiome helps your body digest and absorb nutrients like B vitamins and iron—both essential for hair growth.",
                      tip:
                          "Quick Tip:\nTry sautéing garlic and onions in your meals to support healthy gut flora naturally.",
                    ),
                  );
                case 6:
                  return FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    speed: 500,
                    front: buildFrontCard(
                      title: """🧫 Probiotics""",
                      sources:
                          "\nSources: Kefir, yogurt (with live cultures), kimchi, sauerkraut, miso, tempeh.",
                    ),
                    back: buildBackCard(
                      description:
                          "Probiotics are live beneficial bacteria that keep your gut balanced and reduce inflammation. A balanced gut helps manage internal inflammation, supports hormone regulation, and improves nutrient absorption—all of which influence hair health.",
                      tip:
                          "Quick Tip:\nStart small—add a tablespoon of fermented veggies to your lunch or dinner",
                    ),
                  );
                case 7:
                  return FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    speed: 500,
                    front: buildFrontCard(
                      title: """✨ Postbiotic""",
                      sources:
                          "\nSources: You don’t eat postbiotics directly—they’re produced when you feed your gut the right foods (pre- and probiotics).",
                    ),
                    back: buildBackCard(
                      description:
                          "Postbiotics are the byproducts created by your gut bacteria after they digest prebiotics. They support immune function and reduce inflammation in the body. These compounds help maintain a strong gut lining and calm internal stress signals—both of which help create the right environment for healthy hair growth.",
                      tip:
                          "Quick Tip:\nConsistently combining prebiotic and probiotic foods helps your body naturally produce postbiotics.",
                    ),
                  );

                default:
                  return Card(
                    color: kPrimaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        NutritionModal(
                          text1:
                              'You have successfully completed the "The Gut Health" section',
                          text2:
                              'You can now close this and Check the next pillar (Ingredients) OR you can start optionally self check',
                        ),
                        ElevatedButton(
                            onPressed: () {
                              GutQuestionModal(context);
                            },
                            child: const Text("Start Gut self check"))
                      ],
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
