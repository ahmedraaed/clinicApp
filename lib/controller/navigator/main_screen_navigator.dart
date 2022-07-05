import 'package:flatter_test_ahmed_raaed/view/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/enum.dart';
import '../../view/home_screen.dart';
import '../../view/setting_screen.dart';
import 'main_screen_navigator_state.dart';

class MainScreenNavigatorCubit extends Cubit<MainScreenNavigatorState> {

  MainScreenNavigatorCubit() : super(MainScreenNavigatorInitial()) {
    pageController = PageController(initialPage: MainTabs.home.index);
  }

  MainTabs currentTab = MainTabs.home;
  PageController? pageController;

  final tabs = [
    HomeScreen(),
    SettingsScreen(),
  ];

  changeTab(int index) {
    currentTab = MainTabs.values.elementAt(index);
    pageController!.jumpToPage(index);
    print(currentTab.name);
    emit(MainNavigationChange(index));
  }
}