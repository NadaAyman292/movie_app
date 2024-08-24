import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/strings/images.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/screens/home/widgets/small_banner_widget.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Image.asset(MyImages.bannerImage),
        const ImageIcon(
          AssetImage(
            MyImages.playIcon,
          ),
          color: Colors.white,
        ),
        Positioned(left: 10.w, bottom: -95.h, child: const SmallBannerWidget()),
        Positioned(
            left: 150.w,
            top: 200.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dora and the lost city of gold",
                  style: TextStyles.font14white400Weight,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "2019  PG-13  2h 7m",
                  style: TextStyles.font10grey400Weight,
                ),
              ],
            ))
      ],
    );
  }
}
