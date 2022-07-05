import 'package:flatter_test_ahmed_raaed/view/widgets/text_custom.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingsScreen> {
  bool swithcer=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
            ),
            child: AppBar(
              leading: Icon(Icons.arrow_back_ios_sharp),
              centerTitle: true,
              title: TextCustom(tetxSize: 18, textcolor: Colors.white,
                  textWeight: FontWeight.w500, text: "Setting"),
            ),
          ),
          SizedBox(height: 50,),
          ListTile(
            leading: TextCustom(tetxSize: 15, textcolor: Colors.black54,
                textWeight: FontWeight.normal, text: "dark mode"),trailing: Switch(onChanged: (value){

                  setState(()=>swithcer=value);
          }, value: swithcer,),
          ),
          SizedBox(height: 20,),
          ListTile(
            leading: TextCustom(tetxSize: 15, textcolor: Colors.black54,
                textWeight: FontWeight.normal, text: "Language"),
              title: Container(
                height: 80,
                width: 20,
                child: Column(
                  children: [
                    Text("English",maxLines: 1,),
                    SizedBox(height: 5,),
                    Container(height: 1,width:60,color: Colors.black,),
                    SizedBox(height: 3,),
                    Text("العربيه",maxLines: 1,),
                  ],
                ),

          )
          ),
        ],
      ),
    );
  }
}
