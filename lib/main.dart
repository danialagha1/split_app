import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicle_pooling_app/screens/splash_screen.dart';
import 'package:get/get.dart';
void main() {
  runApp(
     GetMaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge :  GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w300, color: Colors.black),
        ),
      ),
      debugShowCheckedModeBanner: false,
     home: SplashScreen(),
    ),
  );
}
