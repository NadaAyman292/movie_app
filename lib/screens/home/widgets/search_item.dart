import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/models/search_model.dart';

class SearchItem extends StatelessWidget {
  Results results;
  SearchItem({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500${results.backdropPath}",
                  fit: BoxFit.fill,
                )),
            SizedBox(
              width: 5.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  results.title ?? "",
                  style: TextStyles.font15white400Weight,
                ),
                Text(
                  results.releaseDate ?? "",
                  style: TextStyles.font13grey400Weight,
                ),
                Text(
                  results.originalTitle ?? "",
                  style: TextStyles.font13grey400Weight,
                ),
              ],
            ),
          ],
        ),
        Divider()
      ],
    );
  }
}
