import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AbangColors abangColors = AbangColors();
AbangTextStyles abangTextStyles = AbangTextStyles();

class AbangColors {
  AbangColors();

  final Color abangPrimary = const Color(0xff262335);
  final Color abangSecondary = const Color(0xffFF2958);
  final Color abangYellow = const Color(0xffF0CF86);
  final Color abangSecondaryAccent = const Color(0xffF7D7D5);
  final Color abangWhite = const Color(0xffFCFBFF);
}

class AbangTextStyles {
  AbangTextStyles();

  final TextStyle buttonTextStyle = GoogleFonts.outfit(
    textStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: 15,
      fontWeight: FontWeight.w700,
      height: 1.2,
      letterSpacing: 0,
    ),
  );

  final TextStyle smallTextStyle = GoogleFonts.outfit(
    textStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      height: 1.33,
      letterSpacing: 0.1,
    ),
  );

  final TextStyle titleTextStyle = GoogleFonts.outfit(
    textStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: 32,
      fontWeight: FontWeight.w700,
      height: 1.2,
      letterSpacing: 0,
    ),
  );

  final TextStyle descriptionTextStyle = GoogleFonts.outfit(
    textStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      height: 1.2,
      letterSpacing: 0,
    ),
  );

  final TextStyle nextTextStyle = GoogleFonts.outfit(
    textStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 1,
      letterSpacing: 0,
    ),
  );
}
