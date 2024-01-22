import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicle_pooling_app/screens/authentication/driver_login.dart';

class LoginTypeScreen extends StatelessWidget {
  const LoginTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle2 = GoogleFonts.aBeeZee(
        fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Choose Your Login Type",
              style: textStyle2,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCard(
                  "assets/images/driver_logo.png",
                  'Driver',
                  // () => Navigator.push(context,
                  //     MaterialPageRoute(builder: (c) => const DriverLogin())),
                  // () => Get.to(
                  //   const DriverLogin(),
                  //   transition: Transition.downToUp,
                  //   duration: const Duration(seconds: 3),
                  // ),
                  () => Get.to(
                    () => const DriverLoginScreen(),
                    transition: Transition.downToUp,
                    duration: const Duration(seconds: 3),
                  ),
                ),
                const SizedBox(width: 6),
                buildCard(
                  "assets/images/customer_logo.png",
                  'Passenger',
                    () => Get.to(
                    () => const DriverLoginScreen(),
                    transition: Transition.downToUp,
                    duration: const Duration(seconds: 3),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildCard(String imagePath, String label, VoidCallback onTap) {
  final textStyle1 =
      GoogleFonts.aboreto(fontSize: 18, fontWeight: FontWeight.w600);

  return GestureDetector(
    onTap: onTap,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10,
      child: Column(
        children: [
          Container(
            width: 170,
            height: 160,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            label,
            style: textStyle1,
          ),
          const SizedBox(height: 6),
        ],
      ),
    ),
  );
}


