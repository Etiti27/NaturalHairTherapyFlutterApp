import 'package:flip_card/flip_card.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/sleep/Method/sleepSelfCheck.dart';

import '../../../../imports.dart';
import '../../Ingredient/Methods/IngredientCard.dart';
import '../../Nutriton/classesInsideNutrition/NutritionMode.dart';

class FlipcardSleepWidget extends StatefulWidget {
  const FlipcardSleepWidget({super.key});

  @override
  State<FlipcardSleepWidget> createState() => _FlipcardSleepWidgetState();
}

class _FlipcardSleepWidgetState extends State<FlipcardSleepWidget> {
  int currentStep = 1;
  final int totalSteps = 3;

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
              title: "The Hormonal Link Between Sleep and Hair",
            ),
            back: buildBackCardB(
              description:
                  """•	While sleeping, your body releases growth-related hormones (like melatonin and HGH).
                  
	•	These help regulate the anagen phase (growth phase) of your hair cycle.
	
	•	Without good sleep, your follicles may receive fewer signals to grow.""",
            ),
          );
        case 2:
          return FlipCard(
            direction: FlipDirection.HORIZONTAL,
            speed: 500,
            front: buildFrontCardB(
              title: "Lack of Sleep = Hair Stress",
            ),
            back: buildBackCardB(
              description:
                  """•	Inconsistent or short sleep disrupts your nervous system and hormone balance.
                  
	•	This increases cortisol (stress hormone), which interferes with nutrient""",
            ),
          );
        case 3:
          return FlipCard(
            direction: FlipDirection.HORIZONTAL,
            speed: 500,
            front: buildFrontCardB(
              title: "Sleep Is When Repair Happens",
            ),
            back: buildBackCardB(
                description:
                    """•	During deep sleep, your cells regenerate and repair damage.
	
	•	Hair follicles also rely on this time to replenish energy and stay active.
	
	•	Without this reset, the scalp and follicles may become sluggish or inflamed."""),
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
                    SleepSelfcheckQuestion(context);
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
