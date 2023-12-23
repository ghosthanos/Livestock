import 'package:flutter/material.dart';
import 'package:livestock/pages/homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _imageZoomAnimation;
  late Animation<double> _textZoomAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000), // Animation duration
      vsync: this,
    );

    _imageZoomAnimation =
        Tween<double>(begin: 1.3, end: 1.2).animate(_animationController);

    _textZoomAnimation =
        Tween<double>(begin: 0.9, end: 0.8).animate(_animationController);

    // Simulate a time-consuming operation, e.g., fetching data
    Future.delayed(Duration(seconds: 0), () {
      // Start the outro zoom-in animation
      _animationController.forward();
    });

    // Navigate to the next screen after outro animation completes
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => HomePage(),
            transitionsBuilder: (_, anim, __, child) {
              return FadeTransition(
                opacity: anim,
                child: child,
              );
            },
            transitionDuration:
                Duration(milliseconds: 400), // Outro animation duration
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              // Your gradient start color
              // Your gradient end color
              Color.fromRGBO(193, 215, 172, 1),
              Color.fromRGBO(193, 215, 172, 1),
              Color.fromRGBO(178, 214, 146, 1),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _imageZoomAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _imageZoomAnimation.value,
                    child: child,
                  );
                },
                child: Image.asset(
                  'images/app_logo.png',
                  width: 250,
                  height: 250,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 3.5),
              AnimatedBuilder(
                animation: _textZoomAnimation, // Use the text zoom animation
                builder: (context, child) {
                  return Transform.scale(
                    scale: _textZoomAnimation.value,
                    child: child,
                  );
                },
                child: const Text(
                  'Welcome to LiveStock',
                  style: TextStyle(
                    color: Color.fromRGBO(77, 119, 34, 1),
                    fontFamily: 'Poppins',
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
