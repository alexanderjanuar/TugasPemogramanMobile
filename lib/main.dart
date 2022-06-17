import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_pemo/LandingPage.dart';
import 'package:uas_pemo/LoginPage.dart';
import 'package:uas_pemo/RegisterPage.dart';
import 'HomePage.dart';
import 'SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/LoginPage': (context) => const LoginPage(),
        '/RegisterPage': (context) => const RegisterPage(),
        '/HomePage': (context) => HomePage(),
        '/LandingPage': (context) => LandingPage(),

      },
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}
