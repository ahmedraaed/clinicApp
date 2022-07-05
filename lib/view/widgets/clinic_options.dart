import 'package:flatter_test_ahmed_raaed/view/widgets/text_custom.dart';
import 'package:flatter_test_ahmed_raaed/view/widgets/text_from_field_custom.dart';
import 'package:flutter/material.dart';

import '../../controller/cubits.dart';

class ClinicOptions extends StatelessWidget {
   ClinicOptions({required this.ClinicPhoneController,
     required this.ClinicNameController,
     required this.ClinicAddressController,
     Key? key}) : super(key: key);
  TextEditingController ClinicNameController;
  TextEditingController ClinicAddressController;
  TextEditingController ClinicPhoneController;

  @override
  Widget build(BuildContext context) {
   print(AppCubit.get(context).counter);

    return Column(
      children: [
        Row(
          children: [
            TextCustom(tetxSize: 15, textcolor: Colors.black45,
                textWeight: FontWeight.normal, text: "Clinic Name"),
            SizedBox(width: 10,),
            CustomTextFromField(controller: ClinicNameController,
              validation:  (value){
                if(value.toString().isEmpty)
                {
                  return "enter your Clinic Name";
                }
              }, texttype: TextInputType.text,
            ),
          ],),
        SizedBox(height: 15,),
        Row(
          children: [
            TextCustom(tetxSize: 15, textcolor: Colors.black45,
                textWeight: FontWeight.normal, text: "Clinic Address"),
            SizedBox(width: 10,),
            CustomTextFromField(controller: ClinicAddressController,
              texttype: TextInputType.text,
              validation:  (value){
                if(value.toString().isEmpty)
                {
                  return "enter your Clinic Address";
                }
              },)
          ],),
        SizedBox(height: 15,),
        Row(
          children: [
            TextCustom(tetxSize: 15, textcolor: Colors.black45,
                textWeight: FontWeight.normal, text: "Clinic Phone"),
            SizedBox(width: 10,),

            CustomTextFromField(controller: ClinicPhoneController,
              validation:  (value){
              AppCubit.get(context).counter=false;
                if(value.toString().isEmpty)
                {
                  return "enter your Clinic Phone";
                }
              }, texttype: TextInputType.phone,),
          ],),
      ],
    );

  }


}
