abstract class GetDataStates {}

class NewsGetDataInitialStat extends GetDataStates {}

class NewsGetBusinessLoadingState extends GetDataStates {}

class NewsGetBusinessSuccessState extends GetDataStates {}

class NewsGetBusinessFailureState extends GetDataStates {
  final String error;
  NewsGetBusinessFailureState(this.error);
}

class NewsGetSportsLoadingState extends GetDataStates {}

class NewsGetSportsSuccessState extends GetDataStates {}

class NewsGetSportsFailureState extends GetDataStates {
  final String error;
  NewsGetSportsFailureState(this.error);
}

class NewsGetScienceLoadingState extends GetDataStates {}

class NewsGetScienceSuccessState extends GetDataStates {}

class NewsGetScienceFailureState extends GetDataStates {
  final String error;
  NewsGetScienceFailureState(this.error);
}
