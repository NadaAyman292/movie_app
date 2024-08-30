import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/screens/home/widgets/watchlist_item.dart';

class WatchlistTab extends StatelessWidget {
  const WatchlistTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Watchlist",
              style: TextStyles.font22white400Weight,
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10.h,
                    );
                  },
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return const WatchlistItem();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
