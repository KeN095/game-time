import 'package:flutter/material.dart';

class SearchResults extends StatelessWidget {
  final String searchText;
  const SearchResults({super.key, required this.searchText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Results for $searchText'),
          leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: const Center(
          child: Text("This is the search results page"),
        ));
  }
}
