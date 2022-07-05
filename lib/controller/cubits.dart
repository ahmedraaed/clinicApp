
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flatter_test_ahmed_raaed/controller/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:permission_handler/permission_handler.dart';


import '../model/data_model/model.dart';
import '../view/widgets/clinic_options.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(InitState());
  static AppCubit get(context)=>BlocProvider.of(context);

  IconData icon=Icons.keyboard_arrow_down;
  IconData icon2=Icons.keyboard_arrow_down;
  IconData icon3=Icons.keyboard_arrow_down;
  bool changeiconone=false;
  bool changeicontwo=false;
  bool changeiconthree=false;

   void changeIconmethodone()
  {
    changeiconone=!changeiconone;
    if(changeiconone==false)
      {
         icon=Icons.keyboard_arrow_down;
         emit(hidedataStateone());

      }else if(changeiconone==true)
        {
           icon=Icons.keyboard_arrow_up;
           emit(showdataStateone());
        }

  }
  void changeIconmethodtwo()
  {
    changeicontwo=!changeicontwo;
    if(changeicontwo==false)
    {
      icon2=Icons.keyboard_arrow_down;
      emit(showdataStatetwo());

    }else if(changeicontwo==true)
    {
      icon2=Icons.keyboard_arrow_up;
      emit(hidedataStateonetwo());
    }

  }

  void changeIconmethodthree()
  {
    changeiconthree=!changeiconthree;
    if(changeiconthree==false)
    {
      icon3=Icons.keyboard_arrow_down;
      emit(showdataStatethree());

    }else if(changeiconthree==true)
    {
      icon3=Icons.keyboard_arrow_up;
      emit(hidedataStateonethree());
    }

  }


  void userregister({
    required String fullname,
    required String email,
    required String password,
    required String phone,
    required String idpassap,
    required String data_of_birth,
     String? PersonalAddress,
    required String clinicname,
    required String clinicaddress,
    required String clinicphone,

  })async
  {
    emit(RegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value)
    {

      creatdatabase(
        fullname: fullname,
      email: email,
      uid: value.user!.uid,
      phone: phone,
      idpassp: idpassap,
      date_of_birth: data_of_birth,
      personalAddress:PersonalAddress,
        clinicphone: clinicphone,
        clinicaddress: clinicaddress,
        clinicname: clinicname,

      );
      emit(RegisterSucssesState());
    }).catchError((onError){
      print(onError);
      emit(RegisterErrorState(onError));

    });
  }
  void creatdatabase({
    required String fullname,
    required String email,
    required String uid,
    required String idpassp,
    required String date_of_birth,
    required String phone,
    String? personalAddress,
    required String clinicname,
    required String clinicaddress,
    required String clinicphone,
  })
  {
    ModelResgister modelresgister=ModelResgister(
      email: email,
      phone: phone,
      uid: uid ,
      image:profilephoto(),
      idpassport: idpassp,
      fullname: fullname,
      gendermale: null,
      date_of_birth: date_of_birth,
      personalAddress: personalAddress,
      clinicphone: clinicphone,
      clinicaddress: clinicaddress,
      clinicname: clinicname,
      certification:certificate ,
      license: licens,
      audio: audiostring,

    );

    FirebaseFirestore.instance.collection('user').doc(uid).set(
        modelresgister.tomap()
    ).then((value) {
      emit(CreatdataSucssesState());
    }).catchError((onError){
      emit(CreatdataErrorState(onError));
    });


  }
  String profilephoto()
  {
    if(Iamgeprofileurl==null)
      {
        return 'https://img.freepik.com/free-photo/close-up-islamic-new-year-concept_23-2148611670.jpg?t=st=1654581023~exp=1654581623~hmac=689f0e7e4688cbb842fec90cf5cae6c771aa1ab3a314caaf0620955424d0a90b&w=1060';
      }else{
      return Iamgeprofileurl!;
    }
  }


  File? file;
  var path;

  Future PickerFiles()async
  {
     await FilePicker.platform.pickFiles(allowMultiple: false).then((value) {
      if(value==null) return null;
       path =value.files.single.path;

      print(File("path is $path!"));
       file=File(path!);
       emit(pickedScseecedstate());
    }
    ).catchError((onError){
       emit(pickedErrorstate());
     });
  }


  String? certificate;
  void uploadfiles()
  {
    emit(Loadingpickedstate());
    firebase_storage.FirebaseStorage.instance.ref().
    child('Users/${Uri.file(file!.path).pathSegments.last}').putFile(file as File).then((p0) {
      p0.ref.getDownloadURL().then((value) {
        print(value);
        certificate=value;

        emit(UploadScseecedstate());
      }).catchError((onError){
        emit(UploadErrorstate());
      });
    }).catchError((onError){
      emit(UploadErrorstate());
    });

  }


  File? filelicens;
  var path2;

  Future Pickerlicens()async
  {
    await FilePicker.platform.pickFiles(allowMultiple: false).then((value) {
      if(value==null) return null;
      path2 =value.files.single.path;

      print(File("path is $path2!"));
      filelicens=File(path2!);
      emit(pickedScseecedstate());
    }
    ).catchError((onError){
      emit(pickedErrorstate());
    });
  }


  String? licens;
  void uploadLicens()
  {

    emit(Loadingpickedstate());
    firebase_storage.FirebaseStorage.instance.ref().
    child('Users/${Uri.file(filelicens!.path).pathSegments.last}').putFile(filelicens as File).then((p0) {
      p0.ref.getDownloadURL().then((value) {
        print(value);
        licens=value;

        emit(UploadScseecedstate());
      }).catchError((onError){
        emit(UploadErrorstate());
      });
    }).catchError((onError){
      emit(UploadErrorstate());
    });

  }


  File? Iamgefile;
  var path3;

  Future PickerProfileImage()async
  {
    await FilePicker.platform.pickFiles(allowMultiple: false).then((value) {
      if(value==null) return null;
      path3 =value.files.single.path;

      print(File("path is $path3!"));
      Iamgefile=File(path3!);
      uploadImageProfile();
      emit(pickedScseecedstate());
    }
    ).catchError((onError){
      emit(pickedErrorstate());
    });
  }


  String? Iamgeprofileurl;
  void uploadImageProfile()
  {
    emit(Loadingpickedstate());
    firebase_storage.FirebaseStorage.instance.ref().
    child('Users/${Uri.file(Iamgefile!.path).pathSegments.last}').putFile(Iamgefile as File).then((p0) {
      p0.ref.getDownloadURL().then((value) {
        print(value);
        Iamgeprofileurl=value;

        emit(UploadScseecedstate());
      }).catchError((onError){
        emit(UploadErrorstate());
      });
    }).catchError((onError){
      emit(UploadErrorstate());
    });

  }

  bool counter=false;

  List<ClinicOptions> dynamicclicnc=[];

  void addClinc( TextEditingController cliniphone,
       TextEditingController clinicaddress, TextEditingController clinicname,)

  {
    emit(loadClinic());
    dynamicclicnc.add(ClinicOptions(ClinicPhoneController: cliniphone,
      ClinicAddressController: clinicaddress, ClinicNameController: clinicname,));
    emit(addClinic());

  }

  final recorder = FlutterSoundRecorder();

  Future initRecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      emit(Errorpermisson());
      throw 'Permission not granted';
    }

    await recorder.openRecorder();
    recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
    emit(Sucssedpermisson());
  }



    Future startRecord() async {
      await recorder.startRecorder(toFile: "audio");
      emit(record());
    }

    Future stopRecorder() async {
      final filePath = await recorder.stopRecorder();
      audiofile = File(filePath!);
      print('Recorded file path: $filePath');
      emit(stoprecord());
    }


    IconData iconData = Icons.keyboard_voice_rounded;
    bool changeiconvoice=false;

    void recordOrstop()
    {
      changeiconvoice=!changeiconvoice;

      if(changeiconvoice==true)
        {
          iconData=Icons.stop;
          emit(changeIconrecord());

        }else
          {
            iconData = Icons.keyboard_voice_rounded;
            emit(changeIconrecord());

          }
    }

    File? audiofile;
  String? audiostring;
  void uploadaudio()
  {
    emit(Loadingpickedstate());
    firebase_storage.FirebaseStorage.instance.ref().
    child('Users/${Uri.file(audiofile!.path).pathSegments.last}').putFile(audiofile as File).then((p0) {
      p0.ref.getDownloadURL().then((value) {
        print(value);
        audiostring=value;

        emit(UploadScseecedstate());
      }).catchError((onError){
        emit(UploadErrorstate());
      });
    }).catchError((onError){
      emit(UploadErrorstate());
    });

  }


}