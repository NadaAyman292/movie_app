import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/strings/images.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/models/new_releases_response.dart';
import 'package:movie_app/screens/movie_details/movie_details_screen.dart';

class NewReleasesItem extends StatelessWidget {
  Results results;
  NewReleasesItem({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieDetailsScreen.routeName,
            arguments: results.id);
      },
      child: SizedBox(
        width: 100.w,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topLeft,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(
                "https://image.tmdb.org/t/p/w500${results.backdropPath}",
                fit: BoxFit.cover,
                height: 120.h,
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                const ImageIcon(
                  AssetImage(
                    MyImages.bookMarkIcon,
                  ),
                  color: MyColor.darkGreyColor,
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
      ),
    );
  }
}
