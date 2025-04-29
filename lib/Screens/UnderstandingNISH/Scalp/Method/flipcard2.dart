import 'package:flip_card/flip_card.dart';
import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Scalp/Method/Selfcheck.dart';

import '../../../../imports.dart';
import '../../Ingredient/Methods/IngredientCard.dart';
import '../../Nutriton/classesInsideNutrition/NutritionMode.dart';

class FlipcardScalpWidget extends StatefulWidget {
  const FlipcardScalpWidget({super.key});

  @override
  State<FlipcardScalpWidget> createState() => _FlipcardScalpWidgetState();
}

class _FlipcardScalpWidgetState extends State<FlipcardScalpWidget> {
  int currentStep = 1;
  final int totalSteps = 4;

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
              title: "The Scalp Is the Womb of the Hair",
            ),
            back: buildBackCardB(
              description:
                  """	•	It’s where the hair is born, where nutrients are delivered through blood flow, and where healthy growth begins.
                  
                  •	If the womb is unhealthy, the hair will suffer — no matter what products you use afterward.""",
            ),
          );
        case 2:
          return FlipCard(
            direction: FlipDirection.HORIZONTAL,
            speed: 500,
            front: buildFrontCardB(
              title: "The Scalp Reflects Internal Health",
            ),
            back: buildBackCardB(
              description:
                  """•	Poor diet, dehydration, or inflammation can show up in the scalp first — through flaking, itching, or sensitivity.
                  •	This is why nutrition and stress management are also scalp care.
                  Just as plants absorb nutrients through soil, hair receives its nutrients through the scalp. The health of each strand is directly linked to the nutrients available in this “feeding soil.""",
            ),
          );
        case 3:
          return FlipCard(
            direction: FlipDirection.HORIZONTAL,
            speed: 500,
            front: buildFrontCardB(
              title: "Daily Practices to Support a Healthy Scalp",
            ),
            back: buildBackCardB(
                description:
                    """•	Massage regularly to stimulate blood flow and oxygen delivery to the follicles.
	•	Cleanse gently to avoid buildup without stripping natural oils.
	•	Moisturize lightly if your scalp is dry — just like the rest of your skin.
	•	Avoid tight styles, constant manipulation, or stress on the follicles.
"""),
          );
        case 4:
          return FlipCard(
            direction: FlipDirection.HORIZONTAL,
            speed: 500,
            front: buildFrontCardB(
              title: "Scalp Stress Is Real",
            ),
            back: buildBackCardB(
              description:
                  """• Tension, dryness, inflammation, or buildup all create stress for the scalp.
	
	•	Scalp stress can lead to slow growth, weak strands, and even permanent damage if ignored.""",
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
                    selfcheckQuestion(context);
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
