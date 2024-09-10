import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/cubit/home/cubit.dart';
import 'package:movie_app/cubit/home/states.dart';
import 'package:movie_app/repo/home/home_remote_repo_impl.dart';
import 'package:movie_app/screens/home/widgets/popular_movie_item.dart';
import 'package:movie_app/screens/home/widgets/new_releases_item.dart';
import 'package:movie_app/screens/home/widgets/recommended_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRemoteRepoImpl())
        ..getPopularMovies()
        ..getNewRealeasesMovies()
        ..getRecommendedMovies(),
      child: BlocConsumer<HomeCubit, HomeStates>(listener: (context, state) {
        if (state is HomePopularLoadingState) {
          Center(child: CircularProgressIndicator());
        }
      }, builder: (context, state) {
        if (state is HomePopularSuccessState ||
            state is HomeNewRealeasesSuccessState ||
            state is HomeRecommendedSuccessState) {
          return SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount:
                      HomeCubit.get(context).popularResponse?.results?.length ??
                          0,
                  itemBuilder: (context, index, _) {
                    return PopularMovieItem(
                        results: HomeCubit.get(context)
                            .popularResponse!
                            .results![index]);
                  },
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
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                    padding: EdgeInsets.only(top: 22.h, left: 8.w),
                    color: MyColor.secondryColor,
                    width: 420.w,
                    height: 190.h,
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
                            itemCount: HomeCubit.get(context)
                                    .newReleasesResponse
                                    ?.results
                                    ?.length ??
                                0,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return NewReleasesItem(
                                results: HomeCubit.get(context)
                                    .newReleasesResponse!
                                    .results![index],
                              );
                            },
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                    padding: EdgeInsets.only(top: 22.h, left: 8.w, bottom: 20),
                    color: MyColor.secondryColor,
                    height: 380.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Recommended",
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
                            itemCount: HomeCubit.get(context)
                                    .recommendedResponse
                                    ?.results
                                    ?.length ??
                                0,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return RecommendedItem(
                                results: HomeCubit.get(context)
                                    .recommendedResponse!
                                    .results![index],
                              );
                            },
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
