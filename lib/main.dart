import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/theming/theme.dart';
import 'package:movie_app/cubit/movie_details/cubit.dart';
import 'package:movie_app/repo/movie_details/movie_details_remote_repo.dart';
import 'package:movie_app/screens/home/home_screen.dart';
import 'package:movie_app/screens/movie_details/movie_details_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => MovieDetailsCubit(MovieDetailsRemoteRepo())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
          },
          initialRoute: HomeScreen.routeName,
        );
      },
    );
  }
}
