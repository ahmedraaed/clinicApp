import 'package:flatter_test_ahmed_raaed/view/home.dart';
import 'package:flatter_test_ahmed_raaed/view/widgets/clinic_options.dart';
import 'package:flatter_test_ahmed_raaed/view/widgets/drop_menu.dart';
import 'package:flatter_test_ahmed_raaed/view/widgets/drop_menu_custom.dart';
import 'package:flatter_test_ahmed_raaed/view/widgets/text_custom.dart';
import 'package:flatter_test_ahmed_raaed/view/widgets/text_from_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import '../controller/cubits.dart';
import '../controller/states.dart';

class StartScreen extends StatelessWidget {
   StartScreen({Key? key}) : super(key: key);

  TextEditingController MobileController = TextEditingController();
  TextEditingController FullNameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();
  TextEditingController passportController = TextEditingController();
  TextEditingController DateOfBirthController = TextEditingController();
  TextEditingController PersonalAddressController = TextEditingController();
  TextEditingController ClinicNameController = TextEditingController();
  TextEditingController ClinicAddressController = TextEditingController();
  TextEditingController ClinicPhoneController = TextEditingController();



  var formkey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(margin: EdgeInsets.only(top: 20,left: 20,right:20,bottom: 10 ),
        child: BlocProvider(
          create: (BuildContext context) { return AppCubit()..initRecorder(); },
          child: BlocConsumer<AppCubit,AppStates>(
            listener: (BuildContext context, state) {  },
            builder: (BuildContext context, Object? state) {


              return SingleChildScrollView(
                child: SafeArea(
                  child: Form(
                    key:formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Icon(Icons.settings),
                                Text("Language"),
                                SizedBox(height: 5,),
                                TextButton(onPressed:(){} , child: Text("English"),),
                                TextButton(onPressed:(){} , child: Text("العربيه"),),

                              ],
                            ),
                            SizedBox(width: 60,),
                            Stack(
                              children: [
                                CircleAvatar(radius: 35,backgroundImage: NetworkImage(AppCubit.get(context).profilephoto()),),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                  child: InkWell(
                                      onTap:() {
                                        AppCubit.get(context).PickerProfileImage();
                                      },
                                      child: Icon(Icons.camera_alt)),),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 50,),
                        InkWell(onTap: (){
                          AppCubit.get(context).changeIconmethodone();

                        },
                            child: CustomDropMenu(icon:AppCubit.get(context).icon, text: 'personal' ,)),
                        AppCubit.get(context).changeiconone?
                        Container(
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
                              Row(
                                children:[
                                  TextCustom(text: 'Full Name',
                                  tetxSize: 10,
                                  textcolor:Colors.black54 ,
                                  textWeight: FontWeight.normal,),
                                  SizedBox(width: 20,),
                                  CustomTextFromField(controller:FullNameController,
                                    validation: (value){
                                    if(value.toString().isEmpty)
                                      {
                                        return "enter your fullName";
                                      }
                                    }, texttype: TextInputType.text, ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  TextCustom(tetxSize: 10, textcolor: Colors.black45,
                                      textWeight: FontWeight.normal, text:"You Id" ),
                                  SizedBox(width: 40,),
                                  CustomDropMenuSmall(text: 'Passport',colortext: Colors.black45,
                                    widthspace: 2,),
                                  SizedBox(width: 20,),
                                  Expanded(child: CustomTextFromField(
                                      controller: passportController,
                                    texttype: TextInputType.number, validation:  (value){
                                    if(value.toString().isEmpty)
                                    {
                                      return "enter your passport";
                                    }
                                  },
                                  )),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  TextCustom(tetxSize: 10, textcolor: Colors.black45,
                                      textWeight: FontWeight.normal, text:"Gender" ),
                                  SizedBox(width: 40,),
                                  Icon(Icons.circle_outlined),
                                  SizedBox(width: 3,),
                                  Icon(Icons.female_outlined,color: Colors.blue,),
                                  SizedBox(width:5,),
                                  TextCustom(tetxSize: 10, textcolor: Colors.black,
                                      textWeight: FontWeight.bold, text:"Female" ),
                                  SizedBox(width: 40,),
                                  Icon(Icons.circle_outlined),
                                  SizedBox(width: 3,),
                                  Icon(Icons.male_outlined,color: Colors.blue,),
                                  SizedBox(width:5,),
                                  TextCustom(tetxSize: 10, textcolor: Colors.black,
                                      textWeight: FontWeight.bold, text:"male" ),

                                  SizedBox(height: 20,),


                                ],
                              ),
                              SizedBox(height: 20,),
                                 Row(
                                  children: [
                                    TextCustom(tetxSize: 10,
                                        textcolor: Colors.black45,
                                        textWeight: FontWeight.normal, text: "Date of Birth"),
                                    SizedBox(width: 40,),
                                    CustomTextFromField(controller: DateOfBirthController,
                                      texttype: TextInputType.datetime,
                                      validation:  (value){
                                        if(value.toString().isEmpty)
                                        {
                                          return "enter your Date of Birth";
                                        }
                                      },
                                    ),
                                  ],
                                ),

                              SizedBox(height: 20,),
                              Row(
                                children:[
                                  TextCustom(tetxSize: 10,
                                    textcolor: Colors.black45,
                                    textWeight: FontWeight.normal, text: "Personal Address"),
                                  SizedBox(width: 40,),
                                  CustomTextFromField(controller: PersonalAddressController,
                                    validation:  (value){
                                      if(value.toString().isEmpty)
                                      {
                                        return "enter your Personal Address";
                                      }
                                    }, texttype: TextInputType.streetAddress,),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  TextCustom(tetxSize: 10,
                                      textcolor: Colors.black45,
                                      textWeight: FontWeight.normal, text: "City"),
                                  SizedBox(width: 40,),
                                  CustomDropMenuSmall(widthspace: 30,colortext: Colors.black45,
                                    text: "select you city",),
                                ],

                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  TextCustom(tetxSize: 10,
                                      textcolor: Colors.black45,
                                      textWeight: FontWeight.normal, text: "Region"),
                                  SizedBox(width: 40,),
                                  CustomDropMenuSmall(widthspace: 30,colortext: Colors.black45,
                                    text:"select you Region",),
                                ],

                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  TextCustom(tetxSize: 10,
                                      textcolor: Colors.black45,
                                      textWeight: FontWeight.normal,
                                      text: "Mobile"),
                                  SizedBox(width: 40,),
                                  CustomTextFromField(controller: MobileController,
                                    texttype: TextInputType.phone,
                                    validation:  (value){
                                      if(value.toString().isEmpty)
                                      {
                                        return "enter your Mobile";
                                      }
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  TextCustom(tetxSize: 10,
                                      textcolor: Colors.black45,
                                      textWeight: FontWeight.normal,
                                      text: "Email"),
                                  SizedBox(width: 40,),
                                  CustomTextFromField(controller: EmailController,
                                    validation:  (value){
                                      if(value.toString().isEmpty)
                                      {
                                        return "enter your Email";
                                      }
                                    }, texttype: TextInputType.emailAddress,),
                                ],

                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  TextCustom(tetxSize: 10,
                                      textcolor: Colors.black45,
                                      textWeight: FontWeight.normal,
                                      text: "Password"),
                                  SizedBox(width: 40,),
                                  CustomTextFromField(controller: PasswordController,
                                    texttype: TextInputType.text, validation:  (value){
                                        if(value.toString().isEmpty)
                                        {
                                          return "enter your password";
                                        }
                                      },obsecure: true),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  TextCustom(tetxSize: 10,
                                      textcolor: Colors.black45,
                                      textWeight: FontWeight.normal,
                                      text: "ConfirmPassword"),
                                  SizedBox(width: 40,),
                                  CustomTextFromField(controller: ConfirmPasswordController,
                                    validation:  (value){
                                    if(value.toString().isEmpty)
                                    {
                                      return "enter your ConfirmPassword";
                                    }
                                  }, texttype: TextInputType.text,
                                  obsecure: true,),
                                ],
                              ),
                              SizedBox(height: 20,),


                            ],
                          ),
                        ):SizedBox(height: 20,),

                        InkWell(onTap: (){
                          AppCubit.get(context).changeIconmethodtwo();

                        },
                            child: CustomDropMenu(icon:AppCubit.get(context).icon2, text: 'Work info' ,)),
                        if (AppCubit.get(context).changeicontwo)
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    TextCustom(tetxSize: 10,
                                        textcolor: Colors.black45,
                                        textWeight: FontWeight.normal,
                                        text: "Main Speciality"),
                                    SizedBox(width: 40,),

                                    CustomDropMenuSmall(text: 'Select your Spciality',
                                      widthspace:30, colortext: Colors.black45,),
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    TextCustom(tetxSize: 10,
                                        textcolor: Colors.black45,
                                        textWeight: FontWeight.normal,
                                        text: "Sub-Speciality"),
                                    SizedBox(width: 40,),
                                    CustomDropMenuSmall(text: 'Select your Sub-Speciality',
                                      widthspace:30, colortext: Colors.black45,),
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    TextCustom(tetxSize: 10,
                                        textcolor: Colors.black45,
                                        textWeight: FontWeight.normal,
                                        text: "Scientific Degree"),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child: CustomDropMenuSmall(text: 'Select your Scientific Degree',
                                        widthspace:30, colortext: Colors.black45,),
                                    ),

                                  ],
                                ),
                                SizedBox(height: 15,),
                                ClinicOptions(ClinicPhoneController: ClinicPhoneController,
                                    ClinicNameController: ClinicNameController,
                                    ClinicAddressController: ClinicAddressController),
                                if(AppCubit.get(context).dynamicclicnc.isNotEmpty)
                                  Container(
                                  height: 200,
                                  width: double.infinity,
                                  child: Flexible(
                                    child: ListView.builder(
                                      itemBuilder: (context, index) => AppCubit.get(context).dynamicclicnc[index],
                                    itemCount:AppCubit.get(context).dynamicclicnc.length ),
                                  ),
                                )
                                else
                                  SizedBox(height: 20,),
                                Row(
                                    children: [
                                      Expanded(child: SizedBox()),
                                      InkWell(onTap: (){
                                      AppCubit.get(context).addClinc(ClinicPhoneController, ClinicAddressController, ClinicNameController);

                                      }
                                          ,child: Icon(Icons.add_circle,color: Colors.orange,)),
                                      SizedBox(width: 5,),
                                      TextCustom(tetxSize: 12, textcolor: Colors.black, textWeight: FontWeight.bold, text: 'Add')
                                    ],
                                  ),
                                SizedBox(height: 15,),
                                Row(children: [
                                  TextCustom(tetxSize: 12,
                                      textcolor: Colors.black,
                                      textWeight: FontWeight.normal, text: "Upload Certificate"),
                                  SizedBox(width: 20,),
                                  InkWell(
                                    onTap: ()async{
                                      await AppCubit.get(context).PickerFiles();
                                    },
                                      child: Icon(Icons.upload_outlined)),
                                  SizedBox(width: 20,),

                                  if (AppCubit.get(context).file!=null)
                                    Icon(Icons.gpp_good_outlined,color: Colors.blue,)
                                  else SizedBox(width: 40,),


                                  SizedBox(width: 50,),
                                  InkWell(
                                    onTap: (){
                                      AppCubit.get(context).uploadfiles();
                                    },
                                    child: TextCustom(tetxSize: 12,
                                        textcolor: Colors.black,
                                        textWeight: FontWeight.normal, text: "Upload a Photo"),
                                  ),


                                ],),
                                SizedBox(height: 15,),
                                Row(children: [
                                  TextCustom(tetxSize: 12,
                                      textcolor: Colors.black,
                                      textWeight: FontWeight.normal, text: "Upload License   "),
                                  SizedBox(width: 20,),
                                  InkWell(
                                      onTap: (){
                                        AppCubit.get(context).Pickerlicens();
                                      },
                                      child: Icon(Icons.upload_outlined)),
                                  SizedBox(width: 20,),
                                  if (AppCubit.get(context).filelicens!=null)
                                    Icon(Icons.gpp_good_outlined,color: Colors.blue,)
                                  else SizedBox(width: 40,),

                                  SizedBox(width: 50,),

                                  InkWell(
                                    onTap:(){
                                      AppCubit.get(context).uploadLicens();
                                    },
                                    child: TextCustom(tetxSize: 12,
                                        textcolor: Colors.black,
                                        textWeight: FontWeight.normal, text: "Upload a Photo"),
                                  ),
                                ],),
                              ],
                            ),
                          ) else SizedBox(height: 20,),

                        InkWell(onTap: (){
                          AppCubit.get(context).changeIconmethodthree();
                        },
                            child: CustomDropMenu(icon:AppCubit.get(context).icon3, text: 'Medical info',)),
                        AppCubit.get(context).changeiconthree?
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Row(children: [
                                Expanded(
                                  child: TextCustom(tetxSize: 15,
                                      textcolor: Colors.black45,
                                      textWeight: FontWeight.normal,
                                      text: "Please add diagnosis  if any "),
                                ),
                                Icon(Icons.add_circle,color: Colors.orange,),

                              ],),
                              SizedBox(height: 10,),
                              Row(children: [
                                Expanded(
                                  child: TextCustom(tetxSize: 15,
                                      textcolor: Colors.black45,
                                      textWeight: FontWeight.normal,
                                      text: "Please add previouse operattions if any "),
                                ),
                                Icon(Icons.add_circle,color: Colors.orange,),

                              ],),
                              SizedBox(height: 10,),
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(2),
                                      topRight: Radius.circular(2),
                                      bottomLeft: Radius.circular(2),
                                      bottomRight: Radius.circular(2)
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(children: [
                                  Expanded(
                                    child: TextCustom(tetxSize: 15,
                                        textcolor: Colors.black45,
                                        textWeight: FontWeight.normal,
                                        text: "Please add medications if any "),
                                  ),
                                  Icon(Icons.add_circle,color: Colors.orange,),

                                ],),
                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextCustom(tetxSize: 15, textcolor: Colors.black45,
                                        textWeight: FontWeight.normal, text: "Describe your condition by video"),
                                  ),
                                  Icon(Icons.upload_rounded),
                                  Icon(Icons.video_call,size: 30,),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextCustom(tetxSize: 15, textcolor: Colors.black45,
                                        textWeight: FontWeight.normal, text: "Describe your condition by voice"),
                                  ),
                                  StreamBuilder<RecordingDisposition>(
                                    builder: (context, snapshot) {
                                      final duration = snapshot.hasData
                                          ? snapshot.data!.duration
                                          : Duration.zero;

                                      String twoDigits(int n) => n.toString().padLeft(2, '0');

                                      final twoDigitMinutes =
                                      twoDigits(duration.inMinutes.remainder(60));
                                      final twoDigitSeconds =
                                      twoDigits(duration.inSeconds.remainder(60));

                                      return Text(
                                        '$twoDigitMinutes:$twoDigitSeconds',
                                        style: const TextStyle(
                                          color: Colors.deepPurple,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    },
                                    stream: AppCubit.get(context).recorder.onProgress,
                                  ),
                                  InkWell(onTap: ()async {
                                    AppCubit.get(context).recordOrstop();

                                    if (AppCubit.get(context).recorder.isRecording) {
                                      await AppCubit.get(context).stopRecorder();
                                    } else {
                                      await AppCubit.get(context).startRecord();
                                    }
                                  },
                                      child: Icon(AppCubit.get(context).iconData)),
                                  InkWell(onTap: (){
                                    AppCubit.get(context).uploadaudio();
                                  }
                                      ,child:state is Loadingpickedstate? CircularProgressIndicator() :
                                    Icon(Icons.upload,size: 30,)),
                                ],
                              ),
                            ],
                          ),

                        ):SizedBox(height: 20,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black38,
                            shape: StadiumBorder(),
                          ),

                          onPressed: (){
                            if(formkey.currentState!.validate())
                              {
                                AppCubit.get(context).userregister(
                                  fullname: FullNameController.text.trim(),
                                  email: EmailController.text.trim(),
                                  password: PasswordController.text,
                                  phone: MobileController.text.trim(),
                                  idpassap: passportController.text.trim(),
                                  data_of_birth: DateOfBirthController.text,
                                  PersonalAddress: PersonalAddressController.text.trim(),
                                  clinicaddress: ClinicAddressController.text,
                                  clinicname: ClinicNameController.text,
                                  clinicphone: ClinicPhoneController.text,
                                  // license: ,
                                  // certification: ,
                                );
                                Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(),));
                              }

                          }, child: Text("Sign up"),),
                      ],
                    ),
                  ),
                ),
              );
            },

          ),
        ),

      ),
    );
  }
}
