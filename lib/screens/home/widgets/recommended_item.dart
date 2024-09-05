// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/strings/images.dart';

import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/models/recommended_response.dart';

class RecommendedItem extends StatelessWidget {
  Results results;
  RecommendedItem({Key? key, required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500${results.backdropPath}",
                  // Replace with your image URL
                  height: 200.h,

                  width: 150.w,
                  fit: BoxFit.cover,
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
                      results.voteAverage.toString(),
                      style: TextStyles.font10white400Weight,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  results.title ?? "",
                  style: TextStyles.font10white400Weight,
                ),
                SizedBox(height: 4),
                Text(
                  results.releaseDate ?? "",
                  style: TextStyles.font8grey400Weight,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
