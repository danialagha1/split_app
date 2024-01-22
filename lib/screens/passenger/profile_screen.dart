import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final TextStyle style1 = GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      decoration: TextDecoration.underline,
    );

    final TextStyle style2 = GoogleFonts.roboto(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );
    final TextStyle style3 = GoogleFonts.roboto(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );

    final TextStyle style4 = GoogleFonts.openSans(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        toolbarHeight: 60,
        elevation: 0.0,
        backgroundColor: Colors.grey.shade300,
        centerTitle: true,
        title: Text('Profile', style: style2),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 70,
                    child: Image.asset("assets/images/customer_logo.png"),
                  ),
                  TextButton(
                    onPressed: (){},
                    child: Text('Upload Profile Picture', style: style1),
                  ),
                  Text('Muhammad Ebad Ur Rehman', style: style2,),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Text('Account', style: style3,),
            const SizedBox(height: 10,),
            Text('Name', style: style3,),
            Text('Muhammad Ebad Ur Rehman', style: style4,),
            const SizedBox(height: 6,),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 6,),
            Text('Phone Number', style: style3,),
            Text('+92-3189161131', style: style4,),
            const SizedBox(height: 20,),
            Text('Email', style: style3,),
            Text('mibad862@gmail.com', style: style4,),
            const SizedBox(height: 6,),
            const Divider(
              thickness: 2,
            ),

          ],
        ),
      ),
    );
  }
}
