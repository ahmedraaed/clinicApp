import 'package:firebase_core/firebase_core.dart';
import 'package:flatter_test_ahmed_raaed/controller/cubits.dart';
import 'package:flatter_test_ahmed_raaed/core/shared_prefrances.dart';
import 'package:flatter_test_ahmed_raaed/view/home.dart';
import 'package:flatter_test_ahmed_raaed/view/home_screen.dart';
import 'package:flatter_test_ahmed_raaed/view/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/thems.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await sharepref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit(),),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: lightmode,
        darkTheme: darkmode,
        themeMode: ThemeMode.light,

        home: StartScreen(),
      ),
    );
  }
}