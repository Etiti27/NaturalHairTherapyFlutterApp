import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Ingredient/Methods/Questions.dart';
import 'package:natural_hair_therapist/imports.dart';

import '../Nutriton/classesInsideNutrition/NutritionMode.dart';

class Ingredient5 extends StatefulWidget {
  const Ingredient5({super.key});
  static const String id = "ingredient5";

  @override
  State<Ingredient5> createState() => _Ingredient5State();
}

class _Ingredient5State extends State<Ingredient5> {
  // List to hold the ExpansionPanel items
  List<Item> _data = [];

  @override
  void initState() {
    super.initState();
    // Initialize the list with some items
    _data = [
      Item(
        title: 'Individual Response Matters',
        body:
            """Hair doesn’t always respond to ingredients the way it does on paper. 
            
            For example, glycerin is known as a humectant (it attracts moisture), but in dry climates, it might actually pull moisture out of your hair. 
            
            Your location, hair condition, and routine all affect how an ingredient performs.
            
            Just because it works for someone else doesn’t mean it will work for you. Learn how your own hair responds, Listen to your hair!""",
        isExpanded: false,
      ),
      Item(
        title: 'Focus on Hair Needs, Not Hair Types',
        body:
            """Most products are marketed toward curl types, but that can be misleading. A 3B and a 4C curl may both be dry, but require different levels of hydration or protein.

NHT philosophy:
	“Don’t look at the hair type, look at the hair NEED.”

Common Hair Needs:
	•	Moisture Condition
	•	Strength
	•	Scalp soothing
	•	Protein repair
	•	Protection from heat or manipulation""",
        isExpanded: false,
      ),
      Item(
        title: 'Breaking Ingredient Myths',
        body: """🧴 Silicones
	•	✅ Can help with heat protection and reduce frizz.
	•	⚠️ Can cause buildup over time if not removed properly.
	•	✔ Use a clarifying shampoo occasionally to remove them.

Sulfates
	•	⚠️ Some are harsh and can strip natural oils (like SLS).
	•	✅ Others are milder (like sodium cocoyl isethionate in some cleansers).
	•	✔ Use when deep cleansing is needed (e.g., after using heavy oils or butters)

Alcohols
	•	⚠️ Short-chain alcohols like isopropyl alcohol can dry the hair.
	•	✅ Fatty alcohols like cetyl alcohol or stearyl alcohol actually help with moisture and slip.""",
        isExpanded: false,
      ),
      Item(
        title: 'How to Read a Label',
        body: """What to check:
	•	The first 5 ingredients make up the bulk of the product.
	•	Learn the difference between moisturizers, proteins, emollients, and humectants.
	•	Avoid ingredients that consistently dry your hair out—or at least balance them with hydrating ingredients.

NHT Tip: The right product for you is the one with the right ingredients for your current hair need.""",
        isExpanded: false,
      ),
    ];
  }

  // Function to handle the expansion state toggle
  void _handleExpansion(Item item) {
    setState(() {
      item.isExpanded = !item.isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: WelcomeHair(
        header: 'INGREDIENT',
        subheader: 'Know What’s In Your Product – And Why That Matters',
        note: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NutritionModal(
              text1: "Individual Response Matters",
              text2:
                  """Hair doesn’t always respond to ingredients the way it does on paper. 
            
            For example, glycerin is known as a humectant (it attracts moisture), but in dry climates, it might actually pull moisture out of your hair. 
            
            Your location, hair condition, and routine all affect how an ingredient performs.
            
            Just because it works for someone else doesn’t mean it will work for you. Learn how your own hair responds, Listen to your hair!""",
            ),
            NutritionModal(
              text3: ExpansionPanelList(
                expandIconColor: Colors.white,
                materialGapSize: 16,
                elevation: 1,
                expandedHeaderPadding: EdgeInsets.all(0),
                children: _data.map<ExpansionPanel>((item) {
                  int index = _data.indexOf(item) + 1;
                  return ExpansionPanel(
                    highlightColor: Colors.white,
                    backgroundColor: kPrimaryColor,
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        leading: Text(
                          index.toString(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        textColor: Colors.white,
                        title: Text(
                          textAlign: TextAlign.justify,
                          item.title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                    body: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        textAlign: TextAlign.justify,
                        item.body,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    isExpanded: item.isExpanded,
                  );
                }).toList(),
                expansionCallback: (int index, bool isExpanded) {
                  // Toggle the expansion state for the clicked item
                  _handleExpansion(_data[index]);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      QuestionModal(context);
                    },
                    child: const Text("self check - Know Your Ingredients")),
              ],
            )
          ],
        ),
        nextButton: () {
          Navigator.pushNamed(context, Ingredient6.id);
        },
        nextButtonText: 'Next >>',
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}

// Model class to hold each item's data
class Item {
  String title;
  String body;
  bool isExpanded;

  Item({
    required this.title,
    required this.body,
    required this.isExpanded,
  });
}
