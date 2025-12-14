import 'package:flutter/material.dart';

import '../colors/colors.dart';

final ThemeData themeData = ThemeData(
  fontFamily: "OpenSans",
  scaffoldBackgroundColor: kBackground,
  appBarTheme: AppBarTheme(
    backgroundColor: kBackground,
    surfaceTintColor: kBackground,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: kPrimary,
    selectionColor: Color.fromARGB(255, 122, 185, 237),
    selectionHandleColor: kPrimary,
  ),
  expansionTileTheme: ExpansionTileThemeData(
    collapsedBackgroundColor: kWhite,
    tilePadding: EdgeInsets.all(12),
    expansionAnimationStyle: AnimationStyle(
      curve: Curves.easeIn,
      reverseCurve: Curves.easeOut,
      duration: Duration(milliseconds: 500),
      reverseDuration: Duration(milliseconds: 250),
    ),
    collapsedShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: BorderSide(color: Colors.black12),
    ),
    backgroundColor: kWhite,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: BorderSide(color: Colors.black12),
    ),
    childrenPadding: EdgeInsets.all(12),
  ),
  cardTheme: CardThemeData(
    color: kWhite,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: BorderSide(color: Colors.black12),
    ),
  ),
);
