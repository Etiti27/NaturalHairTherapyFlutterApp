import 'package:flip_card/flip_card.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/HairMain/Method/SelfCheckHairMaint.dart';

import '../../../../imports.dart';
import '../../Ingredient/Methods/IngredientCard.dart';
import '../../Nutriton/classesInsideNutrition/NutritionMode.dart';
import '../../Nutriton/flipcard/flipcard.dart';

class FlipcardHairMaintWidget extends StatefulWidget {
  const FlipcardHairMaintWidget({super.key});

  @override
  State<FlipcardHairMaintWidget> createState() =>
      _FlipcardHairMaintWidgetState();
}

class _FlipcardHairMaintWidgetState extends State<FlipcardHairMaintWidget> {
  int currentStep = 1;
  final int totalSteps = 5;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    bool isLandscape = screenWidth > screenHeight;

    Widget buildFlipCard(int step) {
      switch (step) {
        case 1:
          return FlipCard(
            direction: FlipDirection.HORIZONTAL,
            speed: 500,
            front: buildFrontCardB(
              title: "Hair Maintenance = Caring for Hair Strands",
            ),
            back: buildBackCardB(
              description:
                  """•	Washing, conditioning, moisturizing, sealing, detangling, stretching.
                  
                  •	Your hair is no longer connected to the blood supply—it cannot repair itself.
                  
                  •	Your job is to preserve what has already grown.""",
            ),
          );
        case 2:
          return FlipCard(
            direction: FlipDirection.HORIZONTAL,
            speed: 500,
            front: buildFrontCardB(
              title: "Products, Tools & Techniques",
            ),
            back: buildBackCard(
              description:
                  """•	Products: These are your hair maintenance products (shampoo, conditioner, oils, leave-ins).
	•	Tools: Wide-tooth combs, satin scarves, bonnets, microfiber towels.
	•	Techniques: LOC/LCO methods, finger detangling, steaming, greenhouse method.""",
              tip:
                  'tips: Choose tools and methods based on your hair needs, not just trends.',
            ),
          );
        case 3:
          return FlipCard(
            direction: FlipDirection.HORIZONTAL,
            speed: 500,
            front: buildFrontCardB(
              title: "What Is Length Retention?",
            ),
            back: buildBackCardB(
                description:
                    """You don’t grow longer hair — you keep more of what you’ve already grown.
                    
	•	Hair growth is automatic. What you need is retention.
	•	Retention means protecting your ends, minimizing breakage, and being consistent.
	•	Most people are growing hair… they’re just not keeping it."""),
          );
        case 4:
          return FlipCard(
            direction: FlipDirection.HORIZONTAL,
            speed: 500,
            front: buildFrontCardB(
              title: "Hair Maintenance Is a Cycle",
            ),
            back: buildBackCardB(description: """•	Cleanse (gently, regularly)
•	Condition and treat
•	Moisturize and seal
•	Protect at night and during styling

You don’t need 50 products. You need a routine that matches your lifestyle and hair needs.
"""),
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

    return Container(
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
                maxHeight:
                    isLandscape ? screenHeight * 0.5 : screenHeight * 0.5,
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
              if (currentStep == totalSteps)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: kPrimaryColor,
                  ),
                  onPressed: () {
                    HairMaintSelfcheckQuestion(context);
                  },
                  child: Text("self assesment"),
                ),
              ElevatedButton(
                onPressed: currentStep < totalSteps
                    ? () => setState(() => currentStep++)
                    : () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: kPrimaryColor,
                ),
                child: Text(currentStep < totalSteps ? "Next >>" : "close"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
