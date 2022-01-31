import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Colors.dart';


const defaultColor = Colors.cyan;
const goldDefaultColor = Color(0xFFE6CC51);
String? _fontFamily;

ThemeData darkTheme = ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: defaultBackGroundColor,
  tabBarTheme: TabBarTheme(

  ),
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontFamily: 'Jannah',
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  dividerTheme: DividerThemeData(
    color: Color(0xFFA2A2A2),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: Colors.transparent,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      fontSize: 11.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      height: 1.28,
    ),
    subtitle2: TextStyle(
      fontSize: 11.0,
      fontWeight: FontWeight.w400,
      color: goldDefaultColor,
      height: 1.28,
    ),
    headline1: TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.normal,
      color: Colors.white,
      height: 1.28
    ),
    headline2: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: goldDefaultColor,
        height: 1.28
    ),
    headline3: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        height: 1.28
    ),
    bodyText2: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: goldDefaultColor,
        height: 1.28
    ),
    button: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Jannah',
        color: goldDefaultColor,
        height: 1.28
    ),
  ),
  // fontFamily: _fontFamily == null ? 'Jannah' : _fontFamily,
);

// ThemeData darkTheme = ThemeData(
//   primarySwatch: defaultColor,
//   scaffoldBackgroundColor: Colors.transparent,
//   tabBarTheme: TabBarTheme(
//
//   ),
//   appBarTheme: AppBarTheme(
//     titleSpacing: 20.0,
//     backwardsCompatibility: false,
//     systemOverlayStyle: SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       statusBarIconBrightness: Brightness.light,
//     ),
//     backgroundColor: Colors.black.withOpacity(0.2),
//     elevation: 0.0,
//     titleTextStyle: TextStyle(
//       fontFamily: 'Jannah',
//       color: Colors.white,
//       fontSize: 20.0,
//       fontWeight: FontWeight.bold,
//     ),
//     iconTheme: IconThemeData(
//       color: Colors.white,
//     ),
//   ),
//   dividerTheme: DividerThemeData(
//     color: Color(0xFFA2A2A2),
//   ),
//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     type: BottomNavigationBarType.fixed,
//     selectedItemColor: defaultColor,
//     unselectedItemColor: Colors.grey,
//     elevation: 20.0,
//     backgroundColor: Colors.transparent,
//   ),
//   textTheme: TextTheme(
//     bodyText1: TextStyle(
//       fontSize: 18.0,
//       fontWeight: FontWeight.w600,
//       color: goldDefaultColor,
//     ),
//     subtitle1: TextStyle(
//       fontSize: 14.0,
//       fontWeight: FontWeight.w600,
//       color: goldDefaultColor,
//       height: 1.3,
//     ),
//     subtitle2: TextStyle(
//       fontSize: 12.0,
//       fontWeight: FontWeight.w200,
//       color: goldDefaultColor,
//       height: 1.3,
//     ),
//   ),
//   fontFamily: _fontFamily == null ? 'Jannah' : _fontFamily,
// );