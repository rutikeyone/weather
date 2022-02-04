import 'package:flutter/material.dart';

final light = ThemeData(
  primaryColor: const Color(0xffFFFFFF),
  backgroundColor: const Color(0xffFFFFFF),
  iconTheme: const IconThemeData(
    color: Color(0xff474747),
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontFamily: "RobotoSlab",
      color: Color(0xffFFFFFF),
      fontWeight: FontWeight.normal,
      fontSize: 96,
    ),
    headline2: TextStyle(
      fontFamily: "RobotoSlab",
      color: Color(0xff3F3F3F),
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    headline3: TextStyle(
      fontFamily: "RobotoSlab",
      color: Color(0xff929292),
      fontWeight: FontWeight.w400,
      fontSize: 22,
    ),
    bodyText1: TextStyle(
      fontFamily: "RobotoSlab",
      color: Color(0xffFFFFFF),
      fontWeight: FontWeight.normal,
      fontSize: 24,
    ),
    bodyText2: TextStyle(
      fontFamily: "RobotoSlab",
      color: Color(0xffFFFFFF),
      fontWeight: FontWeight.w300,
      fontSize: 18,
    ),
  ),
  cardColor: const Color(0xff437AFF),
  canvasColor: const Color(0xffFFFFFF),
  dividerColor: const Color(0xffFFFFFF),
);
