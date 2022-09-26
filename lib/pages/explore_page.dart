import 'package:flutter/material.dart';
import 'package:tmbd_api_movie_app/models/movie_model.dart';
import 'package:tmbd_api_movie_app/services/services.dart';
import 'package:tmbd_api_movie_app/widgets/movie_list_view.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late Future<MovieModel> comedyFuture,
      romanceFuture,
      horrorFuture,
      dramaFuture,
      familyFuture,
      actionFuture;

  @override
  void initState() {
    comedyFuture = discoverMovies(genreId: 35);
    romanceFuture = discoverMovies(genreId: 10749);
    horrorFuture = discoverMovies(genreId: 27);
    dramaFuture = discoverMovies(genreId: 18);
    familyFuture = discoverMovies(genreId: 10751);
    actionFuture = discoverMovies(genreId: 28);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            height: 70,
            child: Card(
              color: Colors.grey.withOpacity(.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: const [
                    Icon(Icons.search),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Movie Search...',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        MoviesListView(future: comedyFuture, headlineText: 'Comedy Movies'),
        MoviesListView(future: romanceFuture, headlineText: 'Romance Movies'),
        MoviesListView(future: dramaFuture, headlineText: 'Drama Movies'),
        MoviesListView(future: horrorFuture, headlineText: 'Horror Movies'),
        MoviesListView(future: familyFuture, headlineText: 'Family Movies'),
        MoviesListView(future: actionFuture, headlineText: 'Action Movies'),
      ],
    );
  }
}
