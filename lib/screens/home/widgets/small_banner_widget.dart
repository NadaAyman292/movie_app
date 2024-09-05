import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/strings/images.dart';
import 'package:movie_app/core/theming/colors.dart';

class SmallBannerWidget extends StatelessWidget {
  final String image;
  const SmallBannerWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
            child: Image.network(
              image,
              fit: BoxFit.cover,
              height: 150.h,
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
    );
  }
}
