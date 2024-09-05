import 'package:movie_app/models/geners_model.dart';

abstract class GenresRepo {
  Future<GenresModel> getGenresMovies();
}
