import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'LandingPage.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('asset/Logo.png'),
      title: const Text(
        "CodeLink",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xFFFFFFB72B),
        ),
      ),
      backgroundColor: Colors.white,
      loadingText: Text("CodeLink - Learning By Doing"),
      navigator: LandingPage(),
      durationInSeconds: 5,
    );
}}