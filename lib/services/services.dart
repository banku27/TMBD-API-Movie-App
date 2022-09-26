import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tmbd_api_movie_app/models/movie_model.dart';

import '../utils/utils.dart';

const baseUrl = 'https://api.themoviedb.org/3/';
var key = '?api_key=$apiKey';
late String endPoint;

Future<MovieModel> getUpcomingMovies() async {
  endPoint = 'movie/upcoming';
  final url = '$baseUrl$endPoint$key';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    log('success');
    return MovieModel.fromJson(jsonDecode(response.body));
  }
  throw Exception('failed to load upcoming movies');
}

Future<MovieModel> getTrendingMovies() async {
  endPoint = 'trending/all/day';
  final url = '$baseUrl$endPoint$key';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    log('trending movies fetched');
    return MovieModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('failed to load trending');
  }
}

Future<MovieModel> getPopularMovies() async {
  endPoint = 'movie/popular';
  final url = '$baseUrl$endPoint$key';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return MovieModel.fromJson(
      jsonDecode(response.body),
    );
  } else {
    throw Exception('failed to load popular');
  }
}

Future<MovieModel> getPopularTvShows() async {
  endPoint = 'tv/popular';
  final url = '$baseUrl$endPoint$key';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return MovieModel.fromJson(
      jsonDecode(response.body),
    );
  } else {
    throw Exception('failed to load popular');
  }
}

Future<MovieModel> getTopRatedMovies() async {
  endPoint = 'movie/top_rated';
  final String url = '$baseUrl$endPoint$key';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return MovieModel.fromJson(
      jsonDecode(response.body),
    );
  } else {
    throw Exception('failed to load top rated movies');
  }
}

Future<MovieModel> discoverMovies({int? genreId}) async {
  endPoint = 'discover/movie';
  final String url = genreId == null
      ? '$baseUrl$endPoint$key'
      : '$baseUrl$endPoint$key&with_genres=$genreId';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return MovieModel.fromJson(
      jsonDecode(response.body),
    );
  } else {
    throw Exception('failed to load genres');
  }
}
