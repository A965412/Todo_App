import 'package:flutter/material.dart';

class Mytheme {
  static Color primarycolor = const Color(0xffDFECDB);
  static Color bluecolor = const Color(0xff5D9CEC);
  static Color greencolor = const Color(0xff61E757);
  static Color graycolor = const Color(0xffC8C9CB);
  static Color redcolor = const Color(0xffEC4B4B);
  static Color whiteycolor = const Color(0xffFFFFFF);
  static Color blackcolor = const Color(0xff383838);
  static Color primarydarkcolor = const Color(0xff060E1E);
  static Color primarydarkcolorbar = const Color(0xff141922);

  ThemeData lightmood = ThemeData(
      canvasColor: whiteycolor,
      primaryColor: primarycolor,
      appBarTheme: AppBarTheme(
        color: bluecolor,
        elevation: 0,
      ),
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: whiteycolor),
          titleMedium: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: blackcolor),
          titleSmall: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: blackcolor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(
            size: 30,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          unselectedIconTheme: IconThemeData(
            color: graycolor,
          )),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: bluecolor,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: whiteycolor, width: 5),
              borderRadius: BorderRadius.circular(30))));
  ThemeData darktmood = ThemeData(
      canvasColor: whiteycolor,
      primaryColor: primarydarkcolor,
      appBarTheme: AppBarTheme(
        color: bluecolor,
        elevation: 0,
      ),
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: whiteycolor),
          titleMedium: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: blackcolor),
          titleSmall: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: blackcolor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(
            size: 30,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          unselectedIconTheme: IconThemeData()),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: bluecolor,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: whiteycolor, width: 5),
              borderRadius: BorderRadius.circular(30))));
}
