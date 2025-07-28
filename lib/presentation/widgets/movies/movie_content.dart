import 'package:flutter/material.dart';

class MovieContent extends StatelessWidget {
  final List<Widget> children;

  const MovieContent({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Column(
          spacing: 10.0,
          children: children),
        childCount: 1,
      ),
    );
  }
}
