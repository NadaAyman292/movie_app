import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/cubit/filter/filter_cubit.dart';
import 'package:movie_app/cubit/filter/filter_states.dart';
import 'package:movie_app/models/filter_model.dart';
import 'package:movie_app/repo/CategoryMovies/category_movies_remote_repo.dart';
import 'package:movie_app/screens/filter_movies/category_movies_item.dart';

class CategoryMovies extends StatelessWidget {
  static const String routeName = "filterScreen";
  Results results;
  CategoryMovies({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    var genreId = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.secondryColor,
      ),
      body: BlocProvider(
        create: (context) => FilterCubit(
          FilterRemoteRepo(),
        )..filterMovies(genreId),
        child:
            BlocBuilder<FilterCubit, FilterStates>(builder: (context, state) {
          return ListView.builder(
              itemCount:
                  FilterCubit.get(context).filterModel?.results?.length ?? 0,
              itemBuilder: (context, index) {
                return FilterMovieItem(
                  results:
                      FilterCubit.get(context).filterModel!.results![index],
                );
              });
        }),
      ),
    );
  }
}
