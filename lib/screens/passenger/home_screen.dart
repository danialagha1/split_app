import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicle_pooling_app/screens/passenger/bike_rides_screen.dart';
import 'package:vehicle_pooling_app/screens/passenger/car_rides_screen.dart';
import 'package:vehicle_pooling_app/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    TextStyle style1 =
    GoogleFonts.roboto(fontSize: screenWidth * 0.053, fontWeight: FontWeight.w500);
    TextStyle style2 =
    GoogleFonts.roboto(fontSize: screenWidth * 0.041, fontWeight: FontWeight.w400);
    TextStyle style3 =
    GoogleFonts.roboto(fontSize: screenWidth * 0.050, fontWeight: FontWeight.w400);

    return Scaffold(
      drawer:  const UserDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFF0F52BA),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          CircleAvatar(
            child: Image.asset("assets/images/customer_logo.png"),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.036),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: style3,
            ),
            Text(
              'Muhammad Ebad Ur Rehman',
              style: style1,
            ),
            SizedBox(
              height: screenHeight * 0.035,
            ),
            _statusContainer(style1, style2, screenHeight),
            SizedBox(
              height: screenHeight * 0.026,
            ),
            _bikeContainer(style1, style2, screenHeight, screenWidth),
            SizedBox(
              height: screenHeight * 0.026,
            ),
            _carContainer(style1, style2, screenHeight, screenWidth),
          ],
        ),
      ),
    );
  }

  Container _statusContainer(
      TextStyle style1, TextStyle style2, double screenHeight) {
    return Container(
      width: double.infinity,
      height: screenHeight * 0.17,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0F52BA),
              Colors.purple,
            ],
          )),
      child: Container(
        padding: const EdgeInsets.only(left: 10, top: 10),
        width: double.infinity,
        height: screenHeight * 0.16,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Status Bar',
              style: style1,
            ),
            Text(
              'Traveler! Are you ready to Ride and Explore?',
              style: style2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _carContainer(
      TextStyle style1, TextStyle style2, double height, double width) {
    return InkWell(
      onTap: () {
        Get.to(
          () => const CarRidesScreen(),
          transition: Transition.leftToRight,
          duration: const Duration(seconds: 2),
        );
      },
      child: Container(
        width: double.infinity,
        height: height * 0.24,
        padding: const EdgeInsets.only(right: 14, top: 14),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Car Ride',
              style: style1,
            ),
            Text(
              'Sharing is Caring – Share your ride with us!',
              style: style2,
            ),
            SizedBox(
              height: height * 0.030,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                "assets/images/car_logo.png",
                width: width * 0.40,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bikeContainer(
      TextStyle style1, TextStyle style2, double height, double width) {
    return InkWell(
      onTap: () {
        Get.to(
          () => const BikeRidesScreen(),
          transition: Transition.rightToLeft,
          duration: const Duration(seconds: 2),
        );
      },
      child: Container(
        width: double.infinity,
        height: height * 0.24,
        padding: const EdgeInsets.only(left: 14, top: 14),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bike Ride',
              style: style1,
            ),
            Text(
              'Sharing your ride is always more fun.',
              style: style2,
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  "assets/images/bike_logo.png",
                  width: width * 0.40,
                )),
          ],
        ),
      ),
    );
  }
}
