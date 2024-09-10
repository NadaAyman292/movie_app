import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/models/search_model.dart';
import 'package:movie_app/screens/movie_details_for_search/movie_details_for_search.dart';
import 'package:movie_app/screens/movie_details/movie_details_screen.dart';

class SearchItem extends StatelessWidget {
  Results results;
  SearchItem({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, MovieDetailsForSearch.routeName,
                arguments: results);
          },
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500${results.backdropPath}",
                    errorBuilder: (context, error, stackTrace) {
                      return SizedBox(
                        height: 100.h,
                        width: 100.w,
                      );
                    },
                    height: 100.h,
                    width: 100.h,
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                width: 5.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      results.title ?? "",
                      maxLines: 2,
                      style: TextStyles.font15white400Weight,
                    ),
                  ),
                  Text(
                    results.releaseDate ?? "",
                    style: TextStyles.font13grey400Weight,
                  ),
                  SizedBox(
                    width: 220.w,
                    child: Text(
                      results.originalTitle ?? "",
                      style: TextStyles.font13grey400Weight,
                    ),
                  ),
                  Divider()
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
