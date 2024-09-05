import 'package:movie_app/models/new_releases_response.dart';
import 'package:movie_app/models/popular_response.dart';
import 'package:movie_app/models/recommended_response.dart';

abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class HomePopularLoadingState extends HomeStates {}

class HomePopularSuccessState extends HomeStates {
  PopularResponse popularResponse;
  HomePopularSuccessState(this.popularResponse);
}

class HomePopularErrorState extends HomeStates {
  String error;
  HomePopularErrorState(this.error);
}

class HomeNewRealeasesLoadingState extends HomeStates {}

class HomeNewRealeasesSuccessState extends HomeStates {
  NewReleasesResponse newReleasesResponse;
  HomeNewRealeasesSuccessState(this.newReleasesResponse);
}

class HomeNewRealeasesErrorState extends HomeStates {
  String error;
  HomeNewRealeasesErrorState(this.error);
}

class HomeRecommendedLoadingState extends HomeStates {}

class HomeRecommendedSuccessState extends HomeStates {
  RecommendedResponse recommendedResponse;
  HomeRecommendedSuccessState(this.recommendedResponse);
}

class HomeRecommendedErrorState extends HomeStates {
  String error;
  HomeRecommendedErrorState(this.error);
}
