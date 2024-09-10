import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/theming/theme.dart';
import 'package:movie_app/cubit/favorite_movie/favourite_movie_cubit.dart';
import 'package:movie_app/cubit/movie_details/cubit.dart';
import 'package:movie_app/firebase_options.dart';
import 'package:movie_app/models/filter_model.dart';
import 'package:movie_app/repo/movie_details/movie_details_remote_repo.dart';
import 'package:movie_app/screens/filter_movies/category_movies.dart';
import 'package:movie_app/screens/home/home_screen.dart';
import 'package:movie_app/screens/movie_details_for_search/movie_details_for_search.dart';
import 'package:movie_app/screens/home/tabs/watchList_tab.dart';
import 'package:movie_app/screens/movie_details/movie_details_screen.dart';
import 'package:movie_app/screens/movie_recommended_details.dart/movie_recommended_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieDetailsCubit(
            MovieDetailsRemoteRepo(),
          ),
        ),
        BlocProvider(create: (context) => WatchListCubit()..loadWatchList())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: MyThemeData.lightTheme,
          debugShowCheckedModeBanner: false,
          routes: {
            HomeScreen.routeName: (context) => HomeScreen(),
            MovieDetailsScreen.routeName: (context) => MovieDetailsScreen(),
            CategoryMovies.routeName: (context) => CategoryMovies(
                  results: Results(),
                ),
            MovieRecommendedDetailsScreen.routeName: (context) =>
                const MovieRecommendedDetailsScreen(),
            MovieDetailsForSearch.routeName: (context) =>
                const MovieDetailsForSearch(),
          },
          initialRoute: HomeScreen.routeName,
        );
      },
    );
  }
}
