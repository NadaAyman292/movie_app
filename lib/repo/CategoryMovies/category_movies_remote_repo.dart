import 'dart:convert';

import 'package:movie_app/models/filter_model.dart';
import 'package:movie_app/repo/CategoryMovies/category_movies_repo.dart';
import 'package:http/http.dart' as http;

class FilterRemoteRepo implements FilterRepo {
  final String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NTFkZWM1ZmViZWVjMTE4NWEwZGEwNDM2ZjA2NjdhMSIsIm5iZiI6MTcyNTA1Mjk3NS4xNjQyODgsInN1YiI6IjY2ZDIxYTcwYWY5NTliZWFhYjBjMjkyNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CsmN8PR_caWXBdARxj7N0Jtnniycl5SUfTwAmTwNUrU';
  String apiKey = "651dec5febeec1185a0da0436f0667a1";
  @override
  Future<FilterModel> filterMovies(int genreId) async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_genres=$genreId"));

    if (response.statusCode == 200) {
      var jsonFormat = jsonDecode(response.body);
      return FilterModel.fromJson(jsonFormat);
    } else {
      throw Exception('Failed to load Filter movies');
    }
  }
}
