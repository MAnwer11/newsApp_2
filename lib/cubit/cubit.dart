import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oneo_order/cubit/state.dart';
import '../module/business/business_screen.dart';
import '../module/science/science_screen.dart';
import '../module/sports/sports_screen.dart';
import '../network/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomsItem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business_center_rounded),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Setting',
    ),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    BusinessScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    {
      emit(NewsGetBusinessLoadingState());
      DioHelper.getData(url: "v2/top-headlines", query: {
        'country': 'eg',
        'category': 'Business',
        'apiKey': '05b89fc6dcd548e5b6389e17d80caace'
      }).then((value) {
        print(value!.data.toString());
        business = value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetBusinessFailureState(error.toString()));
      });
    }
  }
}
