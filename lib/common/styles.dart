import 'package:flutter/material.dart';

class CustomStyles {
  static Color primaryColor = Color(0xff2C8464);
  static ButtonStyle smallButtonStyle = ButtonStyle(
    minimumSize: MaterialStateProperty.all(Size(double.infinity, 42)),
  );
  static ThemeData customTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: CustomStyles.primaryColor,
    fontFamily: 'SpoqaHanSansNeo',
    cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xffC0C3CA)),
          borderRadius: BorderRadius.circular(10.0),
        )),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Color(0xff303030),
        fontSize: 27,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: Color(0xff303030),
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        color: Color(0xff303030),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: CustomStyles.primaryColor,
      ),
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelColor: Colors.grey,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        ),
        textStyle: MaterialStateProperty.all(
            TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        backgroundColor: MaterialStateProperty.all(
          CustomStyles.primaryColor,
        ),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      filled: true,
      hintStyle: TextStyle(color: Color(0xffA3A9B4)),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );
}
