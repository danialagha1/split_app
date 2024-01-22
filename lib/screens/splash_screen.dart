import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vehicle_pooling_app/screens/start_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(
        seconds: 5,
      ),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (c) => const StartScreen(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
                "assets/images/application_logo.png",
                width: 200,
                ),
          ],
        ),
      ),
    );
  }
}