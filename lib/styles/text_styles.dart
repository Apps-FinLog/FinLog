import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static const TextStyle onboardingTitle = TextStyle(
    fontFamily: 'Geist',
    fontSize: 46,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle onboardingDescription = TextStyle(
    fontFamily: 'Geist',
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: Colors.white70,
  );

  static TextStyle onboardingButton = GoogleFonts.inter(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static TextStyle appBarTitle = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.black, // Assuming black text on a white app bar
  );
}
