import 'package:natural_hair_therapist/Screens/UnderstandingNISH/Nutriton/NISH1.dart';
import 'package:natural_hair_therapist/imports.dart';

class IntroNISH extends StatefulWidget {
  const IntroNISH({super.key});
  static const String id = "introNish";

  @override
  State<IntroNISH> createState() => _IntroNISHState();
}

class _IntroNISHState extends State<IntroNISH> {
  @override
  void initState() {
    change();
    // TODO: implement initState
    super.initState();
  }

  bool changeImage = false;
  Future<void> change() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      changeImage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: !changeImage
          ? const Center(
              child: Image(
                image: AssetImage("assets/images/nii.jpeg"),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  opacity: 0.3,
                  image: AssetImage('assets/images/nii.jpeg'), // Image path
                  fit: BoxFit
                      .cover, // Adjust how the image fits within the container
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Flexible(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 0, bottom: 0),
                      child: Text(
                        textAlign: TextAlign.justify,
                        "Welcome to NIS³H – the holistic framework developed by your Natural Hair Therapist. Tap on each pillar to explore how it supports your hair’s health.",
                        style: TextStyle(
                            fontSize: 25,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Flexible(
                    flex: 5,
                    child: SingleChildScrollView(
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Circle background
                            Container(
                              width: 500,
                              height: 400,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/nii.jpeg'), // Image path
                                  fit: BoxFit
                                      .cover, // Adjust how the image fits within the container
                                ),
                              ),
                            ),
                            // Clickable element 1
                            Positioned(
                              // width: 20,
                              // height: 50,
                              left: 120,
                              top: 30,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, NISH1.id);
                                },
                                child: Text(
                                  """"      """,
                                  style: TextStyle(fontSize: 70),
                                ),
                              ),
                            ),
                            // Clickable element 2
                            Positioned(
                              top: 35,
                              right: 90,
                              child: GestureDetector(
                                onTap: () {
                                  print('Element 2 clicked');
                                },
                                child: Text(
                                  textAlign: TextAlign.center,
                                  """    """,
                                  style: TextStyle(
                                    fontSize: 70,
                                  ),
                                ),
                              ),
                            ),
                            // Clickable element 3

                            Positioned(
                              left: 250,
                              child: GestureDetector(
                                onTap: () {
                                  // Navigator.pushNamed(context, NISH1.id);
                                  print('Element 3 clicked');
                                },
                                child: Text(
                                  """       """,
                                  style: TextStyle(fontSize: 70),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              right: 1,
                              left: 190,
                              child: GestureDetector(
                                onTap: () {
                                  // Navigator.pushNamed(context, NISH1.id);
                                  print('Element 4 clicked');
                                },
                                child: Text(
                                  """      """,
                                  style: TextStyle(fontSize: 70),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 30,
                              left: 20,
                              child: GestureDetector(
                                onTap: () {
                                  // Navigator.pushNamed(context, NISH1.id);
                                  print('Element 5 clicked');
                                },
                                child: Text(
                                  """        """,
                                  style: TextStyle(fontSize: 70),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              child: GestureDetector(
                                onTap: () {
                                  // Navigator.pushNamed(context, NISH1.id);
                                  print('Element 6 clicked.');
                                },
                                child: Text(
                                  """      """,
                                  style: TextStyle(fontSize: 70),
                                ),
                              ),
                            ),

                            // Clickable element 4
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
