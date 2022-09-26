import 'package:flutter/material.dart';
import 'package:tmbd_api_movie_app/models/movie_model.dart';
import 'package:tmbd_api_movie_app/services/services.dart';
import 'package:tmbd_api_movie_app/widgets/movie_list_view.dart';

class SimilarWidget extends StatefulWidget {
  const SimilarWidget(
      {Key? key,
      required this.data,
      required this.index,
      required this.isTvShow})
      : super(key: key);
  final MovieModel data;
  final int index;
  final bool isTvShow;
  @override
  State<SimilarWidget> createState() => _SimilarWidgetState();
}

class _SimilarWidgetState extends State<SimilarWidget> {
  late Future<MovieModel> _future;
  @override
  void initState() {
    _future =
        getSimilar(widget.data.results[widget.index].id!, widget.isTvShow);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MoviesListView(
      future: _future,
      headlineText: 'Similar',
    );
  }
}
