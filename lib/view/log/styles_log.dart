import 'package:flutter/material.dart';

class AppColors {
  static const darkGrey = Color(0XFF635C5C);
  // static const darkBlue = Color(0XFF0B6EFE);
  static const LinearGradient oceanColor = LinearGradient(
    colors: [
      Color(0XFF0B6EFE),
      Color(0XFF00C6FB),
      Color(0XFF5BE7C4),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient sunsetColor = LinearGradient(
    colors: [
      Color(0XFFFF5733),
      Color(0XFFFFC300),
      Color(0XFFDAF7A6),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient blueGradient = LinearGradient(
    colors: [
      Color(0XFF469FEF),
      Color(0XFF5C75F0),
      Color(0XFF6C56F0),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const lightBlue = Color(0xFF4C93EF);
  static const orangeCerah = Color(0xFFFFA500);
}

class CustomText {
  static TextStyle title = const TextStyle(
      fontFamily: 'Outfit',
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
      color: AppColors.darkGrey);

  static TextStyle body = const TextStyle(
      fontFamily: 'Outfit',
      fontWeight: FontWeight.normal,
      fontSize: 16.0,
      color: AppColors.darkGrey);
}
