import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/strings/images.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/models/watchlist_model.dart';

class WatchlistItem extends StatelessWidget {
  WatchList movie;
  void Function()? onTap;
  WatchlistItem({super.key, required this.movie, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w500${movie.image}",
                      fit: BoxFit.cover,
                      width: 100.w,
                      height: 100.h,
                    )),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    InkWell(
                      onTap: onTap,
                      child: ImageIcon(
                        AssetImage(
                          MyImages.bookMarkIcon,
                        ),
                        color: MyColor.yellowColor,
                      ),
                    ),
                    Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 11.h,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              width: 5.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200.w,
                  child: Text(
                    movie.title,
                    style: TextStyles.font15white400Weight,
                  ),
                ),
                Text(
                  movie.releaseDate ?? "",
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
