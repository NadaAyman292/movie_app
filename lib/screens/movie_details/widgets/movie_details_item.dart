// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/strings/images.dart';

import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/models/movie_details_response.dart';

class MovieDetailsItem extends StatelessWidget {
  MovieDetailsResponse? movieDetailsResponse;

  MovieDetailsItem({Key? key, this.movieDetailsResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500${movieDetailsResponse?.backdropPath}",
                  errorBuilder: (context, error, stackTrace) {
                    return SizedBox(
                      width: 100.w,
                      height: 120.h,
                    );
                  },
                  width: 100.w,
                  height: 120.h,
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
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 200.w,
                height: 30.h,
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 5.w,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: movieDetailsResponse!.genres!.length ?? 0,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(
                              color: MyColor.darkGreyColor,
                            )),
                        width: 50.w,
                        height: 40.h,
                        child: Text(
                          movieDetailsResponse!.genres![index].name ?? "",
                          style: TextStyles.font10lightGrey400Weight,
                        ),
                      );
                    }),
              ),
              SizedBox(
                width: 170.w,
                child: Text(
                  movieDetailsResponse?.overview ?? "",
                  maxLines: 5,
                  style: TextStyles.font13lightGrey400Weight,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: MyColor.yellowColor),
                  SizedBox(width: 4.w),
                  Text(
                    movieDetailsResponse?.voteAverage.toString() ?? "",
                    style: TextStyles.font10white400Weight,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
