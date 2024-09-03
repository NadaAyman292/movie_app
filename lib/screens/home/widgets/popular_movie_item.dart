import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/strings/images.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/screens/home/widgets/small_banner_widget.dart';
import 'package:movie_app/models/popular_response.dart';

class PopularMovieItem extends StatelessWidget {
  Results results;
  PopularMovieItem({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Image.network(
          "https://image.tmdb.org/t/p/w500${results.backdropPath}",
          fit: BoxFit.fill,
        ),
        const ImageIcon(
          AssetImage(
            MyImages.playIcon,
          ),
          color: Colors.white,
        ),
        Positioned(
            left: 10.w,
            top: 150.h,
            child: SmallBannerWidget(
              image: "https://image.tmdb.org/t/p/w500${results.backdropPath}",
            )),
        Positioned(
            left: 120.w,
            top: 250.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  results.title ?? "",
                  style: TextStyles.font14white400Weight,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  results.releaseDate ?? "",
                  style: TextStyles.font10grey400Weight,
                ),
              ],
            ))
      ],
    );
  }
}
