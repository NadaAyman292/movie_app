import 'package:movie_app/models/search_model.dart';

abstract class SearchRepo {
  Future<SearchModel> movieSearch(String query);
}
