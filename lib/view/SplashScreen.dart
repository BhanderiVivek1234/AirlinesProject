import 'dart:async';

import 'package:api_example/view/HomePage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation colorAnimation;
  late Animation sizeAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.black)
        .animate(animationController);
    sizeAnimation =
        Tween<double>(begin: 50, end: 200).animate(animationController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    animationController.addListener(() {
      setState(() {
        if (animationController.isCompleted) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
        }
      });
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is Splash Screen"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                height: sizeAnimation.value,
                width: sizeAnimation.value,
                child: RotationTransition(
                  turns:
                      Tween(begin: 0.0, end: 1.0).animate(animationController),
                  child: Image.asset(
                    "assets/Gmail-logo.png",
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Welcome to G-mail",
                  style: TextStyle(
                      fontSize: sizeAnimation.value / 8,
                      color: colorAnimation.value,
                      fontWeight: FontWeight.bold),
                ),
              )
            ]),
      ),
    );
  }
}
