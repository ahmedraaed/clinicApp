import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkmode=ThemeData(
  scaffoldBackgroundColor:HexColor('##353839'),
  appBarTheme: AppBarTheme(
    backgroundColor: HexColor('#fafafa'),
    actionsIconTheme: IconThemeData(color: HexColor('#000000')),
  ),
  primarySwatch:Colors.deepOrange ,
  textTheme: TextTheme(
    bodyText1: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: HexColor('#FBEAEB')),
    bodyText2: TextStyle(fontSize: 10,color:HexColor('#FBEAEB') ,),

  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('#fafafa'),
    selectedItemColor: HexColor('#fafafa'),
  ),
);
ThemeData lightmode=ThemeData(
  scaffoldBackgroundColor:HexColor('##fafafa'),

  appBarTheme: AppBarTheme(
    backgroundColor: HexColor('#353839'),


    elevation: 0,
    actionsIconTheme: IconThemeData(color: HexColor('#072C50')),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: HexColor('#161B21')),
    bodyText2: TextStyle(fontSize: 10,color:HexColor('#161B21') ,),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('#353839'),
    selectedItemColor: HexColor('#353839'),
  ),
  primarySwatch:Colors.purple ,

);