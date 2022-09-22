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
  throw Exception('failed to load trending');
}