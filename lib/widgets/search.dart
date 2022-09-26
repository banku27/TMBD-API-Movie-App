import 'package:flutter/material.dart';
import 'package:tmbd_api_movie_app/models/movie_model.dart';
import 'package:tmbd_api_movie_app/pages/detail_page.dart';
import 'package:tmbd_api_movie_app/services/services.dart';
import 'package:tmbd_api_movie_app/utils/utils.dart';

class Search extends SearchDelegate<MovieModel> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<MovieModel>(
      future: movieSearch(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          final data = snapshot.data?.results;
          return ListView.builder(
            itemCount: data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                          index: index, data: snapshot.data!, isTvShow: false),
                    ),
                  );
                },
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage:
                      NetworkImage('$imageUrl${data[index].posterPath}'),
                ),
                title: Text(data[index].title ?? data[index].name!),
              );
            },
          );
        } else if (query.isEmpty) {
          return const SizedBox();
        } else {
          return const Center(
            child: Text('Not Found'),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
