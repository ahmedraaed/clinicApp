
import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {

   CustomTextFromField({this.obsecure=false,
     required this.texttype,
     required this.validation,
     required this.controller,Key? key}) : super(key: key);
   TextEditingController controller;
   Function validation;
   TextInputType texttype;
   bool obsecure;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width/2,
        height: 50,
        child: TextFormField(
          controller:controller,
          keyboardType: texttype,
          validator: (value) => validation(value),
          obscureText:obsecure ,

          decoration: InputDecoration(
            counterText: ' ',
            border: OutlineInputBorder(
            ),

          ),

        ),
      );

  }
}
