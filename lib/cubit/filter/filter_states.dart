import 'package:movie_app/models/filter_model.dart';

abstract class FilterStates {}

class FilterInitState extends FilterStates {}

class FilterLoadingState extends FilterStates {}

class FilterSuccessState extends FilterStates {
  FilterModel filterModel;
  FilterSuccessState(this.filterModel);
}

class FilterErrorState extends FilterStates {
  String error;
  FilterErrorState(this.error);
}
