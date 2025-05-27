import 'package:flutter/material.dart';

class CustomStyle {
  static String imgasset = "assets/filter.jpeg";
  static String handimg = "assets/hand_emoji.jpg";

  static double Mqh(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double Mqw(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static const SizedBox smallHeight = SizedBox(height: 10);
  static const SizedBox mediumHeight = SizedBox(height: 20);
  static const SizedBox largeHeight = SizedBox(height: 30);
  static const SizedBox hugeHeight = SizedBox(height: 50);
  static const SizedBox highHeight = SizedBox(height: 70);

  static const SizedBox smallWidth = SizedBox(width: 10);
  static const SizedBox mediumWidth = SizedBox(width: 20);
  static const SizedBox largeWidth = SizedBox(width: 30);
  static const SizedBox hugeWidth = SizedBox(width: 50);
  static const SizedBox highWidth = SizedBox(width: 70);

  static const TextStyle normal = TextStyle(
    fontSize: 12,
  );
  static const TextStyle medium = TextStyle(
    fontSize: 18,
  );
  static const TextStyle large = TextStyle(
    fontSize: 22,
  );
  static const TextStyle normalbold = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );
  static const TextStyle mediumbold = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
  );
  static const TextStyle highbold = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 30,
  );
  static const TextStyle largebold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );
}