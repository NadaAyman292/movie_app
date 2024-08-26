import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/theming/theme.dart';
import 'package:movie_app/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
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
          },
          initialRoute: HomeScreen.routeName,
        );
      },
    );
  }
}
