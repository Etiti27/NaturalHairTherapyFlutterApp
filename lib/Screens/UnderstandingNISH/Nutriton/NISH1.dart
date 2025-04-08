import 'package:flip_card/flip_card.dart';
import 'package:natural_hair_therapist/Widgets/NutritionSection.dart';
import 'package:natural_hair_therapist/imports.dart';

import 'classesInsideNutrition/NutritionMode.dart';
import 'flipcard/flipcard.dart';

class NISH1 extends StatefulWidget {
  const NISH1({super.key});
  static const String id = "nish1";

  @override
  State<NISH1> createState() => _NISH1State();
}

class _NISH1State extends State<NISH1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: NutritionSection(
        header: 'NUTRITION',
        subheader: 'Feed Your Hair from the Inside Out',
        note: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kNish1,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Section1: ElevatedButton(
          onPressed: () {
            // Call the _showSideModal function when Section1 is clicked
            _showSideModal(context);
          },
          child: Text(
            "Intro",
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
        ),
        Section2: ElevatedButton(
          onPressed: () {
            _showSideModal2(context);
          },
          child: Text(
            "Building Blocks",
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
        ),
        Section3: ElevatedButton(
          onPressed: () {
            _showSideModal3(context);
          },
          child: Text(
            "Gut Health",
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
        ),
        prevButton: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: kPrimaryColor,
          ),
        ),
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }

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
                      text1:
                          'Hair is made up of a tough protein called keratin',
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

  //second2
  void _showSideModal2(BuildContext context) {
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

  void _showSideModal3(BuildContext context) {
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
                      child: NutritionModal(
                        text1:
                            'You have successfully completed the "The Gut Health" section',
                        text2:
                            'You can now close this and Check the next pillar (Ingredients)',
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
}
