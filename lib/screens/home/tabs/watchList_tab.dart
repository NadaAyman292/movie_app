import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/cubit/favorite_movie/favourite_movie_cubit.dart';
import 'package:movie_app/cubit/favorite_movie/favourite_movie_states.dart';
import 'package:movie_app/screens/home/widgets/watchlist_item.dart';

import '../../../models/new_releases_response.dart';

class WatchlistTab extends StatefulWidget {
  static const String routeName = "watchlistscreen";
  const WatchlistTab({super.key});

  @override
  State<WatchlistTab> createState() => _WatchlistTabState();
}

class _WatchlistTabState extends State<WatchlistTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.primaryColor,
      ),
      body: BlocProvider(
        create: (context) => FavouriteMovieCubit()..getWatchlistMovies(),
        child: BlocBuilder<FavouriteMovieCubit, FavouriteMovieStates>(
            builder: (context, state) {
          if (state is WatchlistMoviesLoaded) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Watchlist",
                    style: TextStyles.font22white400Weight,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10.h,
                          );
                        },
                        itemCount: FavouriteMovieCubit.get(context)
                                .newReleasesResponse
                                ?.results
                                ?.length ??
                            0,
                        itemBuilder: (context, index) {
                          return WatchlistItem(
                            results: state.watchlistMovies[index],
                          );
                        }),
                  )
                ],
              ),
            );
          } else {
            return Center(
                child: Text(
              "some thing error",
              style: TextStyle(color: Colors.white),
            ));
          }
        }),
      ),
    );
  }
}
