import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/home/states.dart';
import 'package:movie_app/models/new_releases_response.dart';
import 'package:movie_app/models/popular_response.dart';
import 'package:movie_app/models/recommended_response.dart';
import 'package:movie_app/repo/home/home_repo.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);
  PopularResponse? popularResponse;
  NewReleasesResponse? newReleasesResponse;
  RecommendedResponse? recommendedResponse;

  Future<void> getPopularMovies() async {
    try {
      emit(HomePopularLoadingState());
      PopularResponse popularResponse = await homeRepo.getPopularMovies();
      this.popularResponse = popularResponse;
      emit(HomePopularSuccessState(popularResponse));
    } catch (e) {
      emit(HomePopularErrorState("something went wrong"));
    }
  }

  Future<void> getNewRealeasesMovies() async {
    try {
      emit(HomeNewRealeasesLoadingState());
      NewReleasesResponse newReleasesResponse =
          await homeRepo.getNewReleasesMovies();
      this.newReleasesResponse = newReleasesResponse;
      emit(HomeNewRealeasesSuccessState(newReleasesResponse));
    } catch (e) {
      emit(HomeNewRealeasesErrorState("something went error"));
    }
  }

  Future<void> getRecommendedMovies() async {
    try {
      emit(HomeRecommendedLoadingState());
      RecommendedResponse recommendedResponse =
          await homeRepo.getRecommendedMovies();
      this.recommendedResponse = recommendedResponse;
      emit(HomeRecommendedSuccessState(recommendedResponse));
    } catch (e) {
      emit(HomeRecommendedErrorState("something went error"));
    }
  }
}
