import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle inter(FontWeight weight, double size, {Color? color}) {
    return GoogleFonts.inter(
      fontWeight: weight,
      fontSize: size,
      color: color,
    );
  }
}
