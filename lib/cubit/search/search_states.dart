import 'package:movie_app/models/search_model.dart';

abstract class SearchStates {}

class SearchInitState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {
  SearchModel searchModel;
  SearchSuccessState(this.searchModel);
}

class SearchErrorState extends SearchStates {
  String error;
  SearchErrorState(this.error);
}
