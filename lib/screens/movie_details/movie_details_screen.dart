import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/strings/images.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/cubit/movie_details/cubit.dart';
import 'package:movie_app/cubit/movie_details/states.dart';
import 'package:movie_app/repo/movie_details/movie_details_remote_repo.dart';
import 'package:movie_app/screens/movie_details/widgets/more_like_item.dart';
import 'package:movie_app/screens/movie_details/widgets/movie_details_item.dart';

class MovieDetailsScreen extends StatefulWidget {
  static const String routeName = "movieDetailsScreen";
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  // void initState() {
  //   Future.delayed(Duration.zero).then((value) async {

  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final int movieId = ModalRoute.of(context)!.settings.arguments as int;
    context.read<MovieDetailsCubit>().getDetailsMovie(movieId);
    //  final int movieId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColor.secondryColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "titles",
            style: TextStyles.font22white400Weight,
          ),
        ),
        body: BlocProvider(
          create: (context) => MovieDetailsCubit(MovieDetailsRemoteRepo()),
          child: BlocBuilder<MovieDetailsCubit, MovieDetailsStates>(
              builder: (context, state) {
            if (MovieDetailsCubit.get(context).movieDetailsResponse == null) {
              return CircularProgressIndicator();
            }
            // final movieDetails = state.movieDetailsResponse;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        "https://image.tmdb.org/t/p/w500${MovieDetailsCubit.get(context).movieDetailsResponse!.backdropPath ?? ""}",
                        fit: BoxFit.fill,
                      ),
                      const ImageIcon(
                        AssetImage(
                          MyImages.playIcon,
                        ),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, top: 20.h),
                    child: Text(
                      MovieDetailsCubit.get(context)
                              .movieDetailsResponse!
                              .title ??
                          "",
                      style: TextStyles.font18white400Weight,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, bottom: 20.h),
                    child: Text(
                      MovieDetailsCubit.get(context)
                              .movieDetailsResponse!
                              .releaseDate ??
                          "",
                      style: TextStyles.font10grey400Weight,
                    ),
                  ),
                  MovieDetailsItem(
                    image:
                        "https://image.tmdb.org/t/p/w500${MovieDetailsCubit.get(context).movieDetailsResponse!.backdropPath}",
                    overView: MovieDetailsCubit.get(context)
                            .movieDetailsResponse!
                            .overview ??
                        "",
                    vote: MovieDetailsCubit.get(context)
                        .movieDetailsResponse!
                        .voteAverage
                        .toString(),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
                      padding:
                          EdgeInsets.only(top: 22.h, left: 8.w, bottom: 20),
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
                              itemCount: MovieDetailsCubit.get(context)
                                      .moreLikeResponseModel
                                      ?.results
                                      ?.length ??
                                  0,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final result = MovieDetailsCubit.get(context)
                                    .moreLikeResponseModel
                                    ?.results?[index];

                                return MoreLikeItem(results: result!);
                              },
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            );
          }),
        ));
  }
}
