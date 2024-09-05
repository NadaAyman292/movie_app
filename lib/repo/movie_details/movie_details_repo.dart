import 'package:movie_app/models/more_like_response_model.dart';
import 'package:movie_app/models/movie_details_response.dart';

abstract class MovieDetailsRepo {
  Future<MovieDetailsResponse> getDetailsMovies(int movie_id);

  Future<MoreLikeResponseModel> getMoreLikeMovies(int movie_id);
}
