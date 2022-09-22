import 'package:flutter/material.dart';
import 'package:tmbd_api_movie_app/main_page.dart';
import 'package:tmbd_api_movie_app/utils/utils.dart';

// https://api.themoviedb.org/3/movie/upcoming?api_key=7502b8c031c79790fe5c0b4f94fd770d

// 7502b8c031c79790fe5c0b4f94fd770d ---api key

// https://api.themoviedb.org/3/

// Api read access token
// eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NTAyYjhjMDMxYzc5NzkwZmU1YzBiNGY5NGZkNzcwZCIsInN1YiI6IjYzMmMxYjAyYmE0ODAyMDA4MTcyNjM5NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.N1SoB26LWgsA33c-5X0DT5haVOD4CfWfRhwpDu9eGkc

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie app',
      theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'poppins',
          iconTheme: const IconThemeData(color: Colors.white),
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
                color: Colors.white,
              ),
              bodyLarge: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              titleLarge: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          scaffoldBackgroundColor: kBackgoundColor,
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
            TargetPlatform.android: ZoomPageTransitionsBuilder()
          })),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}
