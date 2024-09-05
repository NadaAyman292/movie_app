import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/strings/images.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';

import '../../../models/new_releases_response.dart';

class WatchlistItem extends StatelessWidget {
  WatchlistItem({super.key, required this.results});
  Results results;
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
                    child: Image.asset(
                      "assets/images/movie.png",
                      fit: BoxFit.fill,
                    )),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const ImageIcon(
                      AssetImage(
                        MyImages.bookMarkIcon,
                      ),
                      color: MyColor.yellowColor,
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
                Text(
                  results.title ?? "",
                  style: TextStyles.font15white400Weight,
                ),
                Text(
                  "2019",
                  style: TextStyles.font13grey400Weight,
                ),
                Text(
                  "Rosa Salazar, Christoph Waltz",
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
