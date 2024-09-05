import 'package:movie_app/models/geners_model.dart';

abstract class GenresStates {}

class GenresMovieInitState extends GenresStates {}

class GenresMovieLoadingState extends GenresStates {}

class GenresMovieSuccessState extends GenresStates {
  GenresModel generesModel;
  GenresMovieSuccessState(this.generesModel);
}

class GenresMovieErrorState extends GenresStates {
  String error;
  GenresMovieErrorState(this.error);
}
