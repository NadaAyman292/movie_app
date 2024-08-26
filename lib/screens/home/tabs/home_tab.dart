import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/screens/home/widgets/banner_widget.dart';
import 'package:movie_app/screens/home/widgets/new_releases_item.dart';
import 'package:movie_app/screens/home/widgets/recommended_item.dart';
import 'package:movie_app/screens/home/widgets/small_banner_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BannerWidget(),
          SizedBox(
            height: 50.h,
          ),
          NewReleasesItem(),
        ],
      ),
    );
  }
}
