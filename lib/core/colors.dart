import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF2E9F27);
  static const Color secondary = Color(0xFF66BB6A);

  static const Color white = Colors.white;
  static const Color black = Colors.black;

  static const Color grey = Color(0xFFF5F5F5);

  static const LinearGradient greenGradient = LinearGradient(
    colors: [
      Color(0xFF2E9F27),
      Color(0xFF66BB6A),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}