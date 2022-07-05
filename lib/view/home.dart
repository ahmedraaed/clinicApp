import 'package:flatter_test_ahmed_raaed/view/widgets/sellect_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/navigator/main_screen_navigator.dart';
import '../controller/navigator/main_screen_navigator_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainScreenNavigatorCubit(),
      child: Center(
        child: BlocConsumer<MainScreenNavigatorCubit, MainScreenNavigatorState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              body: PageView(
                controller:
                context.read<MainScreenNavigatorCubit>().pageController,
                children: context.read<MainScreenNavigatorCubit>().tabs,
                onPageChanged: (int index) {
                  context.read<MainScreenNavigatorCubit>().changeTab(index);
                },
              ),
              bottomNavigationBar: bottomNavigationBar(),
            );
          },
        ),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return Container(
      height: 100,
      child:  BottomAppBar(
        elevation: 3,
        color: Color(0xFF01725D),
        shape: const CircularNotchedRectangle(),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[

              SectionButton("Home",Icons.home, 0),

              const SizedBox(
                width: 70,
              ),
              SectionButton(
                "Settings",
                Icons.settings,
                1,
              ),
            ]),
      ),

    );
  }
}