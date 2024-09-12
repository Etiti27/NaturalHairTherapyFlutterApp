import 'package:flutter/material.dart';

class AnimatedTextScreen extends StatefulWidget {
  const AnimatedTextScreen({Key? key}) : super(key: key);

  @override
  _AnimatedTextScreenState createState() => _AnimatedTextScreenState();
}

class _AnimatedTextScreenState extends State<AnimatedTextScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controllerAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController and the Animation
    _controllerAnimation = AnimationController(
      duration: const Duration(seconds: 2), // Duration of the animation
      vsync: this,
    );

    // Define a color tween animation
    _colorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.blue,
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
    _controllerAnimation
        .dispose(); // Dispose of the controller when the widget is destroyed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Text Color Example'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _colorAnimation,
          builder: (context, child) {
            return Text(
              "Ask Question",
              style: TextStyle(
                color: _colorAnimation.value, // Apply the animated color value
                fontFamily: "Roboto-Bold",
                fontSize: 30,
              ),
            );
          },
        ),
      ),
    );
  }
}
