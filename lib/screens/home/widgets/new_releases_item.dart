import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/screens/home/widgets/small_banner_widget.dart';

class NewReleasesItem extends StatelessWidget {
  const NewReleasesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 22.h, left: 8.w),
        color: MyColor.secondryColor,
        width: 420.w,
        height: 216.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Release",
              style: TextStyles.font15white400Weight,
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 10.w,
                  );
                },
                itemCount: 16,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SizedBox(
                      height: 128.h, width: 97.w, child: SmallBannerWidget());
                },
              ),
            ),
          ],
        ));
  }
}
