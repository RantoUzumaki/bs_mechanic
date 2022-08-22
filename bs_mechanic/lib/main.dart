import 'package:bs_mechanic/components/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BS Mechanic',
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const SplashPage(),
      // home: AnimatedSplashScreen(
      //   splash: Image.asset("assets/images/logo.png"),
      //   nextScreen: const RegisterPage(),
      //   splashTransition: SplashTransition.fadeTransition,
      //   backgroundColor: purple,
      //   pageTransitionType: PageTransitionType.fade,
      //   duration: 2500,
      // ),
    );
  }
}
