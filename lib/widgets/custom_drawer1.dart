import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicle_pooling_app/screens/authentication/driver_login.dart';
import 'package:vehicle_pooling_app/screens/driver/driver_home_screen.dart';
import 'package:vehicle_pooling_app/screens/passenger/home_screen.dart';
import 'package:vehicle_pooling_app/screens/passenger/profile_screen.dart';

class DriverDrawer extends StatefulWidget {
  const DriverDrawer({Key? key}) : super(key: key);

  @override
  State<DriverDrawer> createState() => _UserDrawerState();
}

class _UserDrawerState extends State<DriverDrawer> {
  final TextStyle style1 = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  final TextStyle style2 = GoogleFonts.roboto(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel", style: TextStyle(color: Color(0xFF0F52BA)),),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0F52BA),
              ),
              onPressed: () {
                Get.offAll(
                  const DriverLoginScreen(),
                );
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _showSwitchDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text("Passenger Mode"),
          content: const Text("Are you sure you want to switch to Passenger Mode?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel", style: TextStyle(color: Color(0xFF0F52BA)),),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0F52BA),
              ),
              onPressed: () {
                Get.offAll(
                  duration: const Duration(seconds: 2),
                  transition: Transition.fadeIn,
                  const HomeScreen(),
                );
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Drawer(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildUserInfo(screenWidth),
              SizedBox(height: screenHeight * 0.040),
              _buildSwitchDriverModeButton(),
              SizedBox(height: screenHeight * 0.030),
              _buildListTile(Icons.home, 'Home', () {
                Navigator.pop(context);
              }),
              _buildListTile(Icons.person, 'Profile', () {
                Get.back();
                Get.to(
                      () => const ProfileScreen(),
                );
              }),
              _buildListTile(Icons.settings, 'Settings', () {
              }),
              const Divider(),
              _buildListTile(Icons.logout, 'LogOut', () {
                _showLogoutDialog();
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: width * 0.030),
        CircleAvatar(
          radius: 30,
          child: Image.asset("assets/images/customer_logo.png"),
        ),
        SizedBox(width: width * 0.030),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Muhammad Ebad'),
            Text('+923189161131'),
          ],
        ),
      ],
    );
  }

  Widget _buildSwitchDriverModeButton() {
    return InkWell(
      onTap: _showSwitchDialog,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF0F52BA),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Switch to Passenger Mode', style: style1),
            const Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: const Color(0xFF0F52BA),
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(
        title,
        style: style2,
      ),
      onTap: onTap,
    );
  }

}
