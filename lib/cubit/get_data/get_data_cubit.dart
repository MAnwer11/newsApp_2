import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oneo_order/cubit/get_data/get_data_state.dart';

import '../../network/dio_helper.dart';

class GetData extends Cubit<GetDataStates> {
  GetData() : super(NewsGetDataInitialStat());
  final dio = DioHelper();
  List<dynamic> business = [];
  void getBusiness() {
    {
      emit(NewsGetBusinessLoadingState());
      dio.getData(url: "v2/top-headlines", query: {
        'country': 'eg',
        'category': 'Business',
        'apiKey': '4a53f6dafb924ba7bf5523de7dafa71a'
      }).then((value) {
        print(value!.data.toString());
        business = value.data['articles'];
        //print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetBusinessFailureState(error.toString()));
      });
    }
  }

  List<dynamic> sports = [];
  void getSports() {
    {
      emit(NewsGetSportsLoadingState());
      dio.getData(url: "v2/top-headlines", query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '4a53f6dafb924ba7bf5523de7dafa71a'
      }).then((value) {
        print(value!.data.toString());
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsFailureState(error.toString()));
      });
    }
  }

  List<dynamic> science = [];
  void getScience() {
    {
      emit(NewsGetScienceLoadingState());
      dio.getData(url: "v2/top-headlines", query: {
        'country': 'eg',
        'category': 'Science',
        'apiKey': '4a53f6dafb924ba7bf5523de7dafa71a'
      }).then((value) {
        print(value!.data.toString());
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceFailureState(error.toString()));
      });
    }
  }
}
