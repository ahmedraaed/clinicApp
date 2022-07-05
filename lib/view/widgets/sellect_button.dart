import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/navigator/main_screen_navigator.dart';
import '../../controller/navigator/main_screen_navigator_state.dart';

class SectionButton extends StatelessWidget {
  IconData icon;
  int index;
  String name;
  SectionButton(this.name,this.icon, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenNavigatorCubit, MainScreenNavigatorState>(
      builder: (context, state) {
        return  Container(
          width: 80,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:  index ==
                context
                    .read<MainScreenNavigatorCubit>()
                    .currentTab
                    .index? Colors.white38:Colors.transparent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                child: IconButton(
                  icon: Icon(icon,color: Colors.white,),
                  onPressed: () {
                    context.read<MainScreenNavigatorCubit>().changeTab(index);
                  },
                ),
              ),
              Text(name,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)

            ],
          ),

        );
      },
    );
  }
}