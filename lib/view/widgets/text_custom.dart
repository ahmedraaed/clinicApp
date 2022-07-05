import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
   TextCustom({required this.tetxSize,
    required this.textcolor,
    required this.textWeight,
     required this.text,
    Key? key}) : super(key: key);

   String text;
  Color textcolor;
  double tetxSize;
  FontWeight textWeight;

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          color: textcolor,
          fontSize: tetxSize,
          fontWeight: textWeight),);
  }
}
