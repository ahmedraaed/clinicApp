import 'package:flutter/material.dart';

class CustomDropMenu extends StatelessWidget {
   CustomDropMenu({required this.icon,required this.text,Key? key}) : super(key: key);

  IconData icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 15,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black54,
      ),
      child: Row(
        children: [
          SizedBox(width: 10,),
          Expanded(child: Text(text,style: TextStyle(color: Colors.white),)),
          Icon(icon,color: Colors.white,),

        ],
      ),
    )
    ;
  }
}
