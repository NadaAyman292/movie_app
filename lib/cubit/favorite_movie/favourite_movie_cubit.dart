import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/favorite_movie/favourite_movie_states.dart';

import '../../models/new_releases_response.dart';

class FavouriteMovieCubit extends Cubit<FavouriteMovieStates> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  FavouriteMovieCubit() : super(MovieAddedToWatchlistInit());

  static FavouriteMovieCubit get(context) => BlocProvider.of(context);
  NewReleasesResponse? newReleasesResponse;
  Future<void> addMovieToWatchlist(Results movie) async {
    try {
      emit(MovieAddedToWatchlistLoading());
      await firestore.collection('watchlist').doc(movie.id.toString()).set({
        'id': movie.id,
        'title': movie.title,
        'backdropPath': movie.backdropPath,
      });
    } catch (e) {
      emit(MovieAddedToWatchlistError(e.toString()));
    }
  }

  Future<void> getWatchlistMovies() async {
    print("jjjj");
    try {
      var querySnapshot = await firestore.collection('watchlist').get();
      var watchlistMovies = querySnapshot.docs
          .map((doc) => Results.fromJson(doc.data()))
          .toList();
      newReleasesResponse = NewReleasesResponse(results: watchlistMovies);

      emit(WatchlistMoviesLoaded(watchlistMovies));
      print(watchlistMovies.length);
    } catch (e) {
      emit(WatchlistMoviesLoadFailed(e.toString()));
    }
  }
}
