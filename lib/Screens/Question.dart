import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Methods/Firebase.dart';
import 'package:natural_hair_therapist/Widgets/AppBarWidget.dart';

import '../Constants.dart';

class QAScreen extends StatefulWidget {
  const QAScreen({Key? key}) : super(key: key);
  static const String id = "question";

  @override
  _QAScreenState createState() => _QAScreenState();
}

class _QAScreenState extends State<QAScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controllerAnimation;
  late Animation<Color?> _colorAnimation;
  @override
  void initState() {
    super.initState();
    getUser();
    _controllerAnimation = AnimationController(
      duration: const Duration(seconds: 2), // Duration of the animation
      vsync: this,
    );

    // Define a color tween animation
    _colorAnimation = ColorTween(
      begin: Colors.white,
      end: kPrimaryColor,
    ).animate(_controllerAnimation);

    // Start the animation and loop it
    _controllerAnimation.forward();
    _controllerAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controllerAnimation.reverse(); // Reverse the animation when completed
      } else if (status == AnimationStatus.dismissed) {
        _controllerAnimation
            .forward(); // Start the animation again when dismissed
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controllerAnimation.dispose();
    print("he was disponsed");
  }

  bool isResponse = false;
  String response = "";
  FirebaseMethods firebases = FirebaseMethods();
  String userName = "";
  void getUser() async {
    await firebases.setCurrentUserName();

    setState(() {
      userName = firebases.getCurrentUserName();
    });
  }

  final TextEditingController _controller = TextEditingController();

  bool _isLoading = false;

  void _submitQuestion() async {
    setState(() {
      _isLoading = true;
    });

    final userInput = _controller.text.trim();
    if (userInput.isEmpty) {
      Navigator.pop(context);
      _isLoading = false;
      isResponse = false;
      return;
    }

    await firebases.getResponse(userInput);

    setState(() {
      response = firebases.getResponseMessage();
      _isLoading = false;
      isResponse = true;
    });
    Navigator.pop(context);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    getUser();
    // print(response);
    return Scaffold(
        appBar: AppBarWidget(
          logo: const Image(
            image: AssetImage("assets/images/logo.png"),
          ),
          title: "Ask Your Question",
        ),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              )
            : Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.fill,
                    opacity: 0.3,
                  ),
                ),
                child: Column(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Hero(
                        tag: "logo",
                        child: Image(
                          width: double.infinity,
                          image: AssetImage("assets/images/logo.png"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome $userName",
                            style: const TextStyle(
                                fontSize: 30,
                                fontFamily: "Roboto-Bold",
                                color: kPrimaryColor),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Card(
                              color: kPrimaryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: !isResponse
                                    ? const Text("data")
                                    : Text(
                                        response,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        bottomNavigationBar: Container(
          height: 100,
          color: kPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
              ),
              onPressed: () async {
                final result = await buildShowModalBottomSheet(
                  context,
                  _controller,
                  _submitQuestion,
                );
                print(" i am the result of: $result");
              },
              child: AnimatedBuilder(
                animation: _colorAnimation,
                builder: (context, child) {
                  return Text(
                    "Ask Question",
                    style: TextStyle(
                      color: _colorAnimation
                          .value, // Apply the animated color value
                      fontFamily: "Roboto-Bold",
                      fontSize: 30,
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context,
      TextEditingController textCL, VoidCallback onPressedMe) {
    return showModalBottomSheet(
      // isDismissible: false,
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context)
                .viewInsets
                .bottom, // Adjusts for keyboard height
            left: 16.0,
            right: 16.0,
            top: 16.0,
          ),
          child: SingleChildScrollView(
            child: Container(
              // height: 500,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min, // Minimize the height
                children: [
                  TextField(
                    controller: textCL,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onPressedMe,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor),
                          child: const Text(
                            "Ask?",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// return Scaffold(
// appBar: AppBar(
// title: const Text('Natural Hair Therapist Q&A'),
// ),
// body: Padding(
// padding: const EdgeInsets.all(16.0),
// child: Column(
// children: [
// TextField(
// controller: _controller,
// decoration: const InputDecoration(
// labelText: 'Ask a hair health-related question',
// ),
// ),
// const SizedBox(height: 16),
// ElevatedButton(
// onPressed: _submitQuestion,
// child: const Text('Get Answer'),
// ),
// const SizedBox(height: 24),
// _isLoading
// ? const CircularProgressIndicator()
//     : Text(
// response,
// style: const TextStyle(fontSize: 18),
// ),
// ],
// ),
// ),
// );
