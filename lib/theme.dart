
import 'package:flutter/material.dart';

class AppTheme{

  static final AppTheme instance = AppTheme._init();
  AppTheme._init();

  TextTheme lightTextTheme = const TextTheme(
    headline1: TextStyle(
        fontWeight: FontWeight.w700, fontFamily: 'IRANSansX-Medium',fontSize: 20,color: Colors.white),
    headline2: TextStyle(fontWeight: FontWeight.w700,fontFamily: 'IRANSansX-Medium',fontSize: 19,color: Colors.white),
    headline3: TextStyle(
        fontWeight: FontWeight.w700, fontFamily: 'IRANSansX-Medium',fontSize: 18,color: Colors.white),
    headline4: TextStyle(
        fontWeight: FontWeight.w700, fontFamily: 'IRANSansX-Medium',fontSize: 17,color: Colors.white),
    headline5: TextStyle(
        fontWeight: FontWeight.w500, fontFamily: 'IRANSansX-Medium',fontSize: 16,color: Colors.white),
    headline6: TextStyle(fontSize: 14.0, fontFamily: 'IRANSansX-Medium',color: Colors.white),
    subtitle1: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
        fontFamily: 'IRANSansX-Medium',color: Colors.white),
    subtitle2: TextStyle(fontFamily: 'IRANSansX-Medium',fontSize: 12,color: Colors.white),
    bodyText1: TextStyle(fontFamily: 'IRANSansX-Medium',fontSize: 16,color: Colors.white),
    bodyText2: TextStyle(fontFamily: 'IRANSansX-Medium',fontSize: 14,color: Colors.white),
    button: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
        fontFamily: 'IRANSansX-Medium',color: Colors.white),
  );

  get lightTheme => ThemeData(textTheme: lightTextTheme,primaryColor: Colors.blueGrey,primarySwatch: Colors.blueGrey,brightness: Brightness.light);

}

