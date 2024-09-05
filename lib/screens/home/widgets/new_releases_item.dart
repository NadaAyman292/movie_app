import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/strings/images.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/cubit/favorite_movie/favourite_movie_cubit.dart';
import 'package:movie_app/models/new_releases_response.dart';
import 'package:movie_app/screens/home/tabs/watchList_tab.dart';
import 'package:movie_app/screens/movie_details/movie_details_screen.dart';

class NewReleasesItem extends StatelessWidget {
  Results results;
  NewReleasesItem({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, MovieDetailsScreen.routeName,
                    arguments: results);
              },
              child: Image.network(
                "https://image.tmdb.org/t/p/w500${results.backdropPath}",
                fit: BoxFit.cover,
                height: 120.h,
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                onTap: () async {
                  final favouriteMovieCubit =
                      context.read<FavouriteMovieCubit>();
                  favouriteMovieCubit.addMovieToWatchlist(results).then((_) {
                    Navigator.pushNamed(context, WatchlistTab.routeName);
                  }).catchError((error) {
                    // Handle the error accordingly, perhaps showing a SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text("Failed to add movie to watchlist")),
                    );
                  });
                },
                child: ImageIcon(
                  size: 30,
                  AssetImage(
                    MyImages.bookMarkIcon,
                  ),
                  color: MyColor.darkGreyColor,
                ),
              ),
              Icon(
                Icons.add,
                color: Colors.white,
                size: 11.h,
              ),
            ],
          )
        ],
      ),
    );
  }
}
