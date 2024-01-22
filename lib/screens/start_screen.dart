import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicle_pooling_app/screens/authentication/driver_login.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String headerText =
        'A Vehicle Pooling App \n allows user to request a ride from one location to another using their smartphones';
    TextStyle style1 =
        GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w600);
    TextStyle style2 =
        GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w400);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/application_logo1.png",
                width: screenWidth * 0.55,
              ),
              Text(
                'Welcome to our Ride Sharing App',
                style: style1,
              ),
               SizedBox(
                height: screenHeight * 0.020,
              ),
              Text(headerText, style: style2, textAlign: TextAlign.center),
              SizedBox(
                height: screenHeight * 0.080,
              ),
              _buildElevatedButton(screenHeight, screenWidth),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _buildElevatedButton(double height, double width) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0F52BA),
        textStyle: GoogleFonts.aBeeZee(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        fixedSize: Size(width * 0.85, height * 0.075),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: () {
        Get.off(
          const DriverLoginScreen(),
          duration: const Duration(seconds: 3),
          transition: Transition.fade,
        );
      },
      child: const Text("Let's Begin Rides"),
    );
  }
}
