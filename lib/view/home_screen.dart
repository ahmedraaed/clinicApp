import 'package:flatter_test_ahmed_raaed/controller/cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: -30, left: -50, child: homeCircleClip()),
          Positioned(right: 20, top: 100, child: userClip()),
          Positioned(top: 280, child: gridItemsList()),
        ],
      ),
    );
  }

  Widget homeCircleClip() {
    return Stack(
      children: [
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            color: Color(0xFF01725D),
          ),
        ),
        Positioned(
            top: -10,
            left: -10,
            child: Container(
              width: 290,
              height: 290,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                color: Color(0xFF29AD92),
              ),
            )),
        Positioned(
          bottom: 90,
          right: 90,
          child: Row(
            children: [
              Text(
                "Home",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.account_balance_outlined,
                size: 50,
                color: Colors.white,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget userClip() {

    return Column(
      children: [
        CircleAvatar(child: Image.network('https://firebasestorage.googleapis.com/v0/b/madical-app-21188.appspot.com/o/Users%2F-5hcy1m.jpg?alt=media&token=3f6da51f-1d1d-4c27-983a-a869968872b2')),
        SizedBox(
          height: 5,
        ),
        Text(
          "Ahmed",
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }

  Widget gridItemsList() {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height:  MediaQuery.of(context).size.height*.56,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        itemCount: 10,
        padding: const EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 20),
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:  2,
            crossAxisSpacing: 17,
            mainAxisSpacing: 12),
        itemBuilder: (BuildContext context, int index) {
          return gideItem();
        },
      ),
    );
  }


  Widget gideItem(){
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: .2,
              blurStyle: BlurStyle.normal,
              offset: Offset(1,10),
            )
          ]
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            child:  Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Circle-icons-phone.svg/2048px-Circle-icons-phone.svg.png"),
          ),
          SizedBox(height: 5,),
          Text("Name",style: TextStyle(color: Colors.black,fontSize: 16),)
        ],
      ),
    );
  }
}