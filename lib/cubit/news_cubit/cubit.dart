import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oneo_order/cubit/news_cubit/state.dart';
import '../../module/business/business_screen.dart';
import '../../module/science/science_screen.dart';
import '../../module/sports/sports_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomsItem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business_center_rounded),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  bool isDark = false;
  void changeThemeMode() {
    isDark = !isDark;
    emit(NewsChangeThemeModeState());
  }
}
