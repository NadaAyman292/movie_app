import 'package:movie_app/models/more_like_response_model.dart';
import 'package:movie_app/models/movie_details_response.dart';

abstract class MovieDetailsStates {}

class MovieDetailsInit extends MovieDetailsStates {}

class MovieDetailsLoadingStates extends MovieDetailsStates {}

class MovieDetailsSuccessStates extends MovieDetailsStates {}

class MovieDetailsErrorStates extends MovieDetailsStates {
  String error;
  MovieDetailsErrorStates(this.error);
}

class MovieMoreLikeLoadingStates extends MovieDetailsStates {}

class MovieMoreLikeSuccessStates extends MovieDetailsStates {
  MoreLikeResponseModel moreLikeResponseModel;
  MovieMoreLikeSuccessStates(this.moreLikeResponseModel);
}

class MovieMoreLikeErrorStates extends MovieDetailsStates {
  String error;
  MovieMoreLikeErrorStates(this.error);
}
