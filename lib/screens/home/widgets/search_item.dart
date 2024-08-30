import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/theming/styles.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: Image.asset(
                  "assets/images/movie.png",
                  fit: BoxFit.fill,
                )),
            SizedBox(
              width: 5.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Alita Battle Angel",
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
