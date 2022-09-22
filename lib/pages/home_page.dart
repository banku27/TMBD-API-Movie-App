import 'package:flutter/material.dart';
import 'package:tmbd_api_movie_app/models/movie_model.dart';
import 'package:tmbd_api_movie_app/services/services.dart';
import 'package:tmbd_api_movie_app/widgets/movie_list_view.dart';
import 'package:tmbd_api_movie_app/widgets/upcoming_movies.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<MovieModel> upcomingFuture, trendingFuture;
  //     popularMoviesFuture,
  //     popularTvFuture,
  //     topRatedFuture;
  // late Future<Credit> creditsFuture;

  @override
  void initState() {
    upcomingFuture = getUpcomingMovies();
    trendingFuture = getTrendingMovies();
    // popularMoviesFuture = getPopularMovies();
    // popularTvFuture = getPopularTvShows();
    // topRatedFuture = getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 25,
        ),
        UpcomingMovies(
          future: upcomingFuture,
        ),
        const SizedBox(
          height: 10,
        ),

        MoviesListView(future: trendingFuture, headlineText: 'Trending'),
        // MoviesListView(
        //     future: popularMoviesFuture, headlineText: 'Popular Movies'),
        // MoviesListView(
        //     future: popularTvFuture, headlineText: 'Popular TV Shows'),
        // MoviesListView(
        //     future: topRatedFuture, headlineText: 'Top Rated Movies'),
      ],
    );
  }
}
