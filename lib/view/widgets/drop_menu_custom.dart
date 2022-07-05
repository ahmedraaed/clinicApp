import 'package:flutter/material.dart';

class CustomDropMenuSmall extends StatelessWidget {
  CustomDropMenuSmall({required this.widthspace,
     required this.text,
     required this.colortext,
     Key? key}) : super(key: key);

  double widthspace;
  Color colortext;
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(

      // height: 15,
      // width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(width: 10,),
          Text(text,style: TextStyle(color: colortext),),
          SizedBox(width: widthspace,),
          Icon(Icons.keyboard_arrow_down,color: colortext,),
        ],
      ),

    )
    ;
  }
}
