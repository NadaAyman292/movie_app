import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/strings/images.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/screens/home/widgets/small_banner_widget.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300.h,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: false,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.linear,
        enlargeCenterPage: true,
        // onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
      items: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Image.asset(
              MyImages.bannerImage,
              fit: BoxFit.fill,
            ),
            const ImageIcon(
              AssetImage(
                MyImages.playIcon,
              ),
              color: Colors.white,
            ),
            Positioned(
                left: 10.w, top: 120.h, child: const SmallBannerWidget()),
            Positioned(
                left: 150.w,
                top: 250.h,
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
        ),
      ],
    );
  }
}
