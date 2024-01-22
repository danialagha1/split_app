import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ThemeText {
  static TextStyle progressHeader = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 40,
      height: 0.5,
      fontWeight: FontWeight.w600);

  static TextStyle style1 =
  GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w400);

  static TextStyle style2 =
      GoogleFonts.roboto(fontSize: 28, fontWeight: FontWeight.w500);


  static TextStyle progressBody = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.white,
      fontSize: 10,
      height: 0.5,
      fontWeight: FontWeight.w400);

  static TextStyle progressFooter = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 20,
      height: 0.5,
      fontWeight: FontWeight.w600);
}
