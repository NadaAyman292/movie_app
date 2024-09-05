import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/search/search_states.dart';
import 'package:movie_app/models/search_model.dart';
import 'package:movie_app/repo/search/search_repo.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchRepo searchRepo;
  SearchCubit(this.searchRepo) : super(SearchInitState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchModel;

  Future<void> movieSearch(String query) async {
    try {
      emit(SearchLoadingState());
      SearchModel searchModel = await searchRepo.movieSearch(query);
      this.searchModel = searchModel;
      emit(SearchSuccessState(searchModel));
    } catch (e) {
      emit(SearchErrorState("something went wrong"));
    }
  }
}
