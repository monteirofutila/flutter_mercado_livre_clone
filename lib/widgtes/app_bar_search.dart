import 'package:flutter/material.dart';

class AppSearchBar extends SearchDelegate<String> {
  final products = [
    'Pad',
    'Iphone',
    'Macbook',
    'Mochila HP',
    'AirPhone',
  ];

  final recentSearchs = [
    'Facebook',
    'Iphone',
    'Macbook',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
          close(context, query);
        },
        icon: Icon(Icons.cancel),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        query = "";
        close(context, query);
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text('Resultado para pesquisa: $query');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = query.isEmpty ? recentSearchs : products;
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          leading: Icon(Icons.youtube_searched_for),
          onTap: () {
            print(results[index]);
          },
        );
      },
      itemCount: results.length,
    );
  }
}
