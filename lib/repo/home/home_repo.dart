import 'package:movie_app/models/new_releases_response.dart';
import 'package:movie_app/models/popular_response.dart';
import 'package:movie_app/models/recommended_response.dart';

abstract class HomeRepo {
  Future<PopularResponse> getPopularMovies();

  Future<NewReleasesResponse> getNewReleasesMovies();

  Future<RecommendedResponse> getRecommendedMovies();
}
