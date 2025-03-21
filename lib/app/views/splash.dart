import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hello_cipher/app/views/home_view.dart';
import 'package:page_transition/page_transition.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/logo.png',
      splashIconSize: 150,
      nextScreen: HomeView(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.black,
      duration: 2000,
      pageTransitionType: PageTransitionType.rightToLeft,
    );
  }
}
