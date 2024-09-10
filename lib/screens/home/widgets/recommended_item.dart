// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/strings/images.dart';

import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/cubit/favorite_movie/favourite_movie_cubit.dart';
import 'package:movie_app/models/recommended_response.dart';
import 'package:movie_app/models/watchlist_model.dart';
import 'package:movie_app/screens/movie_details/movie_details_screen.dart';
import 'package:movie_app/screens/movie_recommended_details.dart/movie_recommended_details_screen.dart';

class RecommendedItem extends StatefulWidget {
  Results results;
  RecommendedItem({Key? key, required this.results}) : super(key: key);

  @override
  State<RecommendedItem> createState() => _RecommendedItemState();
}

class _RecommendedItemState extends State<RecommendedItem> {
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
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieRecommendedDetailsScreen.routeName,
            arguments: widget.results);
      },
      child: Container(
        height: 128.h,
        width: 150.w,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: MyColor.secondryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 5.0,
              spreadRadius: 2.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.r)),
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500${widget.results.backdropPath}",
                    // Replace with your image URL
                    height: 200.h,

                    width: 150.w,
                    fit: BoxFit.cover,
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
                                  widget.results.releaseDate?.substring(0, 4) ??
                                      '',
                            );
                            context
                                .read<WatchListCubit>()
                                .addMovie(watchListItem);
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
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: MyColor.yellowColor),
                      SizedBox(width: 4.w),
                      Text(
                        widget.results.voteAverage.toString(),
                        style: TextStyles.font10white400Weight,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    widget.results.title ?? "",
                    style: TextStyles.font10white400Weight,
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.results.releaseDate ?? "",
                    style: TextStyles.font8grey400Weight,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
