import 'dart:convert';
import 'package:movie_app/models/new_releases_response.dart';
import 'package:movie_app/models/popular_response.dart';
import 'package:movie_app/models/recommended_response.dart';
import 'package:movie_app/repo/home/home_repo.dart';
import 'package:http/http.dart' as http;

class HomeRemoteRepoImpl implements HomeRepo {
  final String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NTFkZWM1ZmViZWVjMTE4NWEwZGEwNDM2ZjA2NjdhMSIsIm5iZiI6MTcyNTA1Mjk3NS4xNjQyODgsInN1YiI6IjY2ZDIxYTcwYWY5NTliZWFhYjBjMjkyNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CsmN8PR_caWXBdARxj7N0Jtnniycl5SUfTwAmTwNUrU'; // Replace with your actual Bearer token

  @override
  Future<PopularResponse> getPopularMovies() async {
    Uri url = Uri.parse("https://api.themoviedb.org/3/movie/popular");
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var jsonFormat = jsonDecode(response.body);
      return PopularResponse.fromJson(jsonFormat);
    } else {
      throw Exception('Failed to load popular movies');
    }
  }

  @override
  Future<NewReleasesResponse> getNewReleasesMovies() async {
    Uri url = Uri.parse("https://api.themoviedb.org/3/movie/upcoming");
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var jsonFormat = jsonDecode(response.body);
      return NewReleasesResponse.fromJson(jsonFormat);
    } else {
      throw Exception('Failed to load popular movies');
    }
  }

  @override
  Future<RecommendedResponse> getRecommendedMovies() async {
    Uri url = Uri.parse("https://api.themoviedb.org/3/movie/top_rated");
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var jsonFormat = jsonDecode(response.body);
      return RecommendedResponse.fromJson(jsonFormat);
    } else {
      throw Exception('Failed to load popular movies');
    }
  }
}
