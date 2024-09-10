import 'package:movie_app/models/filter_model.dart';

abstract class FilterRepo {
  Future<FilterModel> filterMovies(int genreId);
}
