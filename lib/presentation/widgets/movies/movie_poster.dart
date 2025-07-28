import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  final String path;

  const MoviePoster(this.path, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: CachedNetworkImage(imageUrl: path, 
        width: 140.0,
        height: 210.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
