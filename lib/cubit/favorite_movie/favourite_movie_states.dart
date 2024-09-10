import 'package:movie_app/models/geners_model.dart';
import 'package:movie_app/models/watchlist_model.dart';

abstract class WatchListState {}

class WatchListInitState extends WatchListState {}

class WatchListLoadingState extends WatchListState {}

class WatchListSuccessState extends WatchListState {
  List<WatchList> watchlist;
  WatchListSuccessState(this.watchlist);
}

class WatchListErrorState extends WatchListState {
  String error;
  WatchListErrorState(this.error);
}
