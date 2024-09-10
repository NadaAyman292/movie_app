import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/strings/images.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/cubit/favorite_movie/favourite_movie_cubit.dart';
import 'package:movie_app/models/new_releases_response.dart';
import 'package:movie_app/models/watchlist_model.dart';
import 'package:movie_app/screens/movie_details/movie_details_screen.dart';

class NewReleasesItem extends StatefulWidget {
  Results results;

  NewReleasesItem({
    super.key,
    required this.results,
  });

  @override
  State<NewReleasesItem> createState() => _NewReleasesItemState();
}

class _NewReleasesItemState extends State<NewReleasesItem> {
  @override
  void initState() {
    super.initState();
    isBookmarked = context
        .read<WatchListCubit>()
        .isMovieInWatchList(widget.results.id.toString());
  }

  bool isBookmarked = false;
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
                    arguments: widget.results);
              },
              child: Image.network(
                "https://image.tmdb.org/t/p/w500${widget.results.backdropPath}",
                fit: BoxFit.cover,
                height: 120.h,
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    if (isBookmarked) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              '${widget.results.title} is already in Watchlist!'),
                        ),
                      );
                    } else {
                      var watchListItem = WatchList(
                        id: widget.results.id.toString(),
                        title: widget.results.title ?? "",
                        image: widget.results.backdropPath ?? "",
                        releaseDate:
                            widget.results.releaseDate?.substring(0, 4) ?? '',
                      );
                      context.read<WatchListCubit>().addMovie(watchListItem);
                      isBookmarked = true;

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              '${widget.results.title} added to Watchlist!'),
                        ),
                      );
                    }
                  });
                },
                child: ImageIcon(
                  size: 30,
                  AssetImage(
                    MyImages.bookMarkIcon,
                  ),
                  color: isBookmarked
                      ? MyColor.yellowColor
                      : MyColor.darkGreyColor,
                ),
              ),
              Icon(
                isBookmarked ? Icons.check : Icons.add,
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
