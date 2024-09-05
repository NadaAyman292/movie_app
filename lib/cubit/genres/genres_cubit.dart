import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/genres/genres_states.dart';
import 'package:movie_app/models/geners_model.dart';
import 'package:movie_app/repo/genres/genres_repo.dart';

class GenresCubit extends Cubit<GenresStates> {
  GenresRepo genresRepo;
  GenresCubit(this.genresRepo) : super(GenresMovieInitState());
  static GenresCubit get(context) => BlocProvider.of(context);
  GenresModel? model;

  Future<void> getGenresMovies() async {
    try {
      emit(GenresMovieLoadingState());
      GenresModel genresModel = await genresRepo.getGenresMovies();
      model = genresModel;
      emit(GenresMovieSuccessState(genresModel));
    } catch (e) {
      emit(GenresMovieErrorState("something went wrong"));
    }
  }
}
