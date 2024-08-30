import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/strings/images.dart';
import 'package:movie_app/core/theming/colors.dart';

class SmallBannerWidget extends StatelessWidget {
  const SmallBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topLeft,
      children: [
        Image.asset(
          MyImages.smallBanner,
          fit: BoxFit.fill,
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
    );
  }
}
