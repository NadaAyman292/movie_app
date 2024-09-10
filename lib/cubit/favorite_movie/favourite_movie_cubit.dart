import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/favorite_movie/favourite_movie_states.dart';
import 'package:movie_app/models/watchlist_model.dart';

class WatchListCubit extends Cubit<WatchListState> {
  WatchListCubit() : super(WatchListInitState());

  final List<WatchList> _watchList = [];

  List<WatchList> get watchList => _watchList;
  static WatchListCubit get(context) => BlocProvider.of(context);

  void loadWatchList() {
    emit(WatchListLoadingState());
    emit(WatchListSuccessState(_watchList));
  }

  void addMovie(WatchList movie) {
    _watchList.add(movie);

    emit(WatchListSuccessState(_watchList));
  }

  bool isMovieInWatchList(String movieId) {
    return _watchList.any((item) => item.id == movieId);
  }

  void removeMovie(String movieId) {
    _watchList.removeWhere((item) => item.id == movieId);
    emit(WatchListSuccessState(List.from(_watchList)));
  }
}
