import 'package:natural_hair_therapist/imports.dart';

// import 'openai_service.dart'; // Ensure this is the correct file path

class EndOfNish extends StatefulWidget {
  static const String id = "endofnish";

  const EndOfNish({super.key});
  @override
  _EndOfNishState createState() => _EndOfNishState();
}

class _EndOfNishState extends State<EndOfNish> {
  Future<void> updateDone(email, course, isDone) async {
    DatabaseService update = await DatabaseService();
    await update.updateDone(email, course, isDone);
    update.closeConnection();
  }

  @override
  Widget build(BuildContext context) {
    final questionnaire = Provider.of<ProviderClass>(context);
    final newEmail = questionnaire.getEmail();
    const nextCourse = "ishaircaredone";

    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: Container(
          // height: double.infinity,
          decoration: BackgroundImage(),
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SecondaryNavigation(
                    title: "Congratulations!",
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Card(
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    // Shadow effect

                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                """You've successfully completed the "Understanding NISH" module!.""",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 25.0),
                              // Text(responseText),
                              Text(
                                kENDOFNISH,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        iconAlignment: IconAlignment.end,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor),
                        onPressed: () async {
                          await updateDone(newEmail, nextCourse, true);
                          await Navigator.pushNamed(context, Dashboard2.id,
                              arguments: nextCourse);
                        },
                        child: const Text(
                          textAlign: TextAlign.end,
                          "Next >>",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
