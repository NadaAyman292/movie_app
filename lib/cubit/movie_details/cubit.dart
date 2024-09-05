import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/movie_details/states.dart';
import 'package:movie_app/models/more_like_response_model.dart';
import 'package:movie_app/models/movie_details_response.dart';
import 'package:movie_app/repo/movie_details/movie_details_repo.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsStates> {
  MovieDetailsRepo movieDetailsRepo;
  MovieDetailsCubit(this.movieDetailsRepo) : super(MovieDetailsInit());
  MovieDetailsResponse? movieDetailsResponse;
  MoreLikeResponseModel? moreLikeResponseModel;

  static MovieDetailsCubit get(context) => BlocProvider.of(context);
  Future<void> getDetailsMovie(int movie_id) async {
    try {
      emit(MovieDetailsLoadingStates());

      MovieDetailsResponse response =
          await movieDetailsRepo.getDetailsMovies(movie_id);
      movieDetailsResponse = response;
      print("lllllllllllllllllll${movieDetailsResponse == null}");

      emit(MovieDetailsSuccessStates());
    } catch (e) {
      emit(MovieDetailsErrorStates("something went wrong"));
    }
  }

  //more likkke movie

  Future<void> getMoreLikeMovie(int movie_id) async {
    try {
      emit(MovieMoreLikeLoadingStates());
      MoreLikeResponseModel moreLikeResponseModel =
          await movieDetailsRepo.getMoreLikeMovies(movie_id);
      this.moreLikeResponseModel = moreLikeResponseModel;
      emit(MovieMoreLikeSuccessStates(moreLikeResponseModel));
    } catch (e) {
      emit(MovieMoreLikeErrorStates("something went wrong"));
    }
  }
}
