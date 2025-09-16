import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:trivvo/domain/entities/entities.dart';

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  @override
  String? get searchFieldLabel => "Search Movies";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      FadeIn(
        animate: query.isNotEmpty,
        child: IconButton(
          onPressed: () {
            query.isEmpty ? null : query = "";
          },
          icon: Icon(PhosphorIconsRegular.x),
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: Icon(PhosphorIconsRegular.caretLeft),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("buildResults");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text("buildSuggestions");
  }
}
