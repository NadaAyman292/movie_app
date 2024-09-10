import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/cubit/favorite_movie/favourite_movie_cubit.dart';
import 'package:movie_app/cubit/favorite_movie/favourite_movie_states.dart';
import 'package:movie_app/screens/home/widgets/watchlist_item.dart';

class WatchlistTab extends StatelessWidget {
  static const String routeName = "watchlistscreen";
  const WatchlistTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.primaryColor,
      ),
      body: BlocBuilder<WatchListCubit, WatchListState>(
          builder: (context, state) {
        if (state is WatchListSuccessState) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Watchlist",
                  style: TextStyles.font22white400Weight,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 10.h,
                        );
                      },
                      itemCount: state.watchlist.length,
                      itemBuilder: (context, index) {
                        return WatchlistItem(
                          movie: state.watchlist[index],
                          onTap: () {
                            WatchListCubit.get(context)
                                .removeMovie(state.watchlist[index].id);
                          },
                        );
                      }),
                )
              ],
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      }),
    );
  }
}
