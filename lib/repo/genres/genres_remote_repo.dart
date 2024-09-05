import 'dart:convert';

import 'package:movie_app/models/geners_model.dart';
import 'package:movie_app/repo/genres/genres_repo.dart';
import 'package:http/http.dart' as http;

class GenresRemoteRepo implements GenresRepo {
  final String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NTFkZWM1ZmViZWVjMTE4NWEwZGEwNDM2ZjA2NjdhMSIsIm5iZiI6MTcyNTA1Mjk3NS4xNjQyODgsInN1YiI6IjY2ZDIxYTcwYWY5NTliZWFhYjBjMjkyNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CsmN8PR_caWXBdARxj7N0Jtnniycl5SUfTwAmTwNUrU';

  @override
  Future<GenresModel> getGenresMovies() async {
    Uri url = Uri.parse("https://api.themoviedb.org/3/genre/movie/list");
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var jsonFormat = jsonDecode(response.body);
      return GenresModel.fromJson(jsonFormat);
    } else {
      throw Exception('Failed to load Genres movies');
    }
  }
}
