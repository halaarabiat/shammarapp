import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shammarapp/register/SignUp.dart';
import 'package:shammarapp/firebase_options.dart';
import 'package:shammarapp/test/beeProduct.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: "/products", page: () => const BeeProducts()),
        // Add more routes if needed
      ],
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}
class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => MyLoginSignupScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/splashscreen.png",);

  }
}
