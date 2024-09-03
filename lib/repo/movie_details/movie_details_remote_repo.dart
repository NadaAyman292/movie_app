import 'dart:convert';
import 'package:movie_app/models/more_like_response_model.dart';
import 'package:movie_app/models/movie_details_response.dart';
import 'package:movie_app/repo/movie_details/movie_details_repo.dart';
import 'package:http/http.dart' as http;

class MovieDetailsRemoteRepo implements MovieDetailsRepo {
  final String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NTFkZWM1ZmViZWVjMTE4NWEwZGEwNDM2ZjA2NjdhMSIsIm5iZiI6MTcyNTA1Mjk3NS4xNjQyODgsInN1YiI6IjY2ZDIxYTcwYWY5NTliZWFhYjBjMjkyNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CsmN8PR_caWXBdARxj7N0Jtnniycl5SUfTwAmTwNUrU';
  @override
  Future<MovieDetailsResponse> getDetailsMovies(int movie_id) async {
    Uri url = Uri.parse("https://api.themoviedb.org/3/movie/$movie_id");
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      print("200000000000");
      var jsonFormat = jsonDecode(response.body);
      print(jsonFormat);
      return MovieDetailsResponse.fromJson(jsonFormat);
    } else {
      print("4000000000");
      throw Exception('Failed to load MovieDetailsResponse');
    }
  }

  @override
  Future<MoreLikeResponseModel> getMoreLikeMovies(int movie_id) async {
    Uri url = Uri.parse("https://api.themoviedb.org/3/movie/$movie_id/similar");
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var jsonFormat = jsonDecode(response.body);
      return MoreLikeResponseModel.fromJson(jsonFormat);
    } else {
      throw Exception('Failed to load MoreLikeResponseModel');
    }
  }
}
