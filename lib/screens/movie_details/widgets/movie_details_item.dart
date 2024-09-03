// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/screens/home/widgets/small_banner_widget.dart';

class MovieDetailsItem extends StatelessWidget {
  String image;
  String overView;
  String vote;
  MovieDetailsItem({
    Key? key,
    required this.image,
    required this.overView,
    required this.vote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            image,
            width: 100,
            height: 120,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // ...[].map(
              //   (e) {
              //     return Container(
              //       alignment: Alignment.center,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(4.r),
              //           border: Border.all(
              //             color: MyColor.darkGreyColor,
              //           )),
              //       width: 65.w,
              //       height: 25.h,
              //       child: Text(
              //         "Action",
              //         style: TextStyles.font10lightGrey400Weight,
              //       ),
              //     );
              //   },
              // ).toList(),
              SizedBox(
                width: 170.w,
                child: Text(
                  overView,
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
                    vote,
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
