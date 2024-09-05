import 'dart:convert';

import 'package:movie_app/models/search_model.dart';
import 'package:movie_app/repo/search/search_repo.dart';
import 'package:http/http.dart' as http;

class SearchRemoteRepo implements SearchRepo {
  final String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NTFkZWM1ZmViZWVjMTE4NWEwZGEwNDM2ZjA2NjdhMSIsIm5iZiI6MTcyNTA1Mjk3NS4xNjQyODgsInN1YiI6IjY2ZDIxYTcwYWY5NTliZWFhYjBjMjkyNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CsmN8PR_caWXBdARxj7N0Jtnniycl5SUfTwAmTwNUrU'; // Replace with your actual Bearer token

  @override
  Future<SearchModel> movieSearch(String query) async {
    Uri url =
        Uri.parse("https://api.themoviedb.org/3/search/movie?query=$query");
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var jsonFormat = jsonDecode(response.body);
      return SearchModel.fromJson(jsonFormat);
    } else {
      throw Exception('Failed to load popular movies');
    }
  }
}
