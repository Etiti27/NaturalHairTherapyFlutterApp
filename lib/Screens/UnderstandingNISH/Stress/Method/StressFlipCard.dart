import 'package:flip_card/flip_card.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Stress/Method/StressSelfCheck.dart';

import '../../../../imports.dart';
import '../../Ingredient/Methods/IngredientCard.dart';
import '../../Nutriton/classesInsideNutrition/NutritionMode.dart';

class FlipcardStressWidget extends StatefulWidget {
  const FlipcardStressWidget({super.key});

  @override
  State<FlipcardStressWidget> createState() => _FlipcardStressWidgetState();
}

class _FlipcardStressWidgetState extends State<FlipcardStressWidget> {
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
              title: "How to Recognize Stress in the Body",
            ),
            back: buildBackCardB(
              description:
                  """•	Physical signs: fatigue, headaches, tense shoulders, breakouts, digestive issues.
	•	Emotional signs: irritability, anxiety, poor sleep, trouble focusing.
	•	Hair signs: sudden shedding, fragile strands, dryness that doesn’t improve.

	🧠 Your hair is often the last to receive nutrients—and the first to show when something’s wrong.
""",
            ),
          );
        case 2:
          return FlipCard(
            direction: FlipDirection.HORIZONTAL,
            speed: 500,
            front: buildFrontCardB(
              title: "What Stress Does to Hair",
            ),
            back: buildBackCardB(
              description:
                  """•	Constricts blood vessels in the scalp = less oxygen and nutrients to follicles
	
	•	Increases scalp inflammation = itchy, tight, or flaky scalp
	
	•	Shuts down or pauses the hair growth cycle = more shedding, slower regrowth""",
            ),
          );
        case 3:
          return FlipCard(
            direction: FlipDirection.HORIZONTAL,
            speed: 500,
            front: buildFrontCardB(
              title: "How to Support Your Body Through Stress",
            ),
            back: buildBackCardB(
                description:
                    """•	Breathe deeply: Box breathing or 4-7-8 technique daily
	•	Move your body: Gentle walks, stretching, dance
	•	Sleep more: Rest is repair
	•	Reconnect: Nature, journaling, quiet time
	•	Eat calming foods: Magnesium-rich (avocado, dark leafy greens, seeds)

	“Taking care of your nervous system is taking care of your hair.”"""),
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
                    StressSelfcheckQuestion(context);
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
