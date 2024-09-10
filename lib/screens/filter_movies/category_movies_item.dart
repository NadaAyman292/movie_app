import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/theming/styles.dart';

import '../../models/filter_model.dart';

class FilterMovieItem extends StatelessWidget {
  Results results;
  FilterMovieItem({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500${results.backdropPath}",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return SizedBox(
                        height: 150.h,
                        width: 100.w,
                      );
                    },
                    height: 150.h,
                    width: 100.w,
                  )),
              SizedBox(
                width: 5.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * 0.5,
                    child: Text(
                      results.title ?? "",
                      style: TextStyles.font15white400Weight,
                    ),
                  ),
                  Text(
                    results.releaseDate ?? "",
                    style: TextStyles.font13grey400Weight,
                  ),
                ],
              ),
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
