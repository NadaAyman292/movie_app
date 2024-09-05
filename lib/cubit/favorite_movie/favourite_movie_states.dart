import 'package:movie_app/models/new_releases_response.dart';

abstract class FavouriteMovieStates {}

class MovieAddedToWatchlistInit extends FavouriteMovieStates {}

class MovieAddedToWatchlistLoading extends FavouriteMovieStates {}

class MovieAddedToWatchlistSuccess extends FavouriteMovieStates {}

class MovieAddedToWatchlistError extends FavouriteMovieStates {
  String error;
  MovieAddedToWatchlistError(this.error);
}

class WatchlistMoviesLoaded extends FavouriteMovieStates {
  final List<Results> watchlistMovies;

  WatchlistMoviesLoaded(this.watchlistMovies);
}

class WatchlistMoviesLoadFailed extends FavouriteMovieStates {
  String error;
  WatchlistMoviesLoadFailed(this.error);
}
