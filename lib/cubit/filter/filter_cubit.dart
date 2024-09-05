import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/filter/filter_states.dart';
import 'package:movie_app/models/filter_model.dart';
import 'package:movie_app/repo/CategoryMovies/category_movies_repo.dart';

class FilterCubit extends Cubit<FilterStates> {
  FilterRepo filterRepo;
  FilterCubit(this.filterRepo) : super(FilterInitState());
  static FilterCubit get(context) => BlocProvider.of(context);
  FilterModel? filterModel;

  Future<void> filterMovies(int genreId) async {
    try {
      emit(FilterLoadingState());
      FilterModel filterModel = await filterRepo.filterMovies();
      this.filterModel = filterModel;
      emit(FilterSuccessState(filterModel));
    } catch (e) {
      emit(FilterErrorState("something error"));
    }
  }
}
