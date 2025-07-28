import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:trivvo/domain/entities/entities.dart';

class MovieCast extends StatelessWidget {
  final bool isLoading;
  final List<Cast> castList;
  const MovieCast({super.key, required this.castList, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Skeletonizer(
      enabled: isLoading,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.0,

        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Cast',
              style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
          ),

          SizedBox(
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: isLoading ? 10 : castList.length,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              itemBuilder: (context, index) {
                final cast = isLoading ? Cast.skeleton() : castList[index];

                return Container(
                  width: 100.0,
                  margin: const EdgeInsets.only(right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: cast.profilePath != null
                            ? CachedNetworkImage(
                                imageUrl: cast.profilePath!,
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'assets/images/blank-profile.png',
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.cover,
                              ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        cast.name,
                        style: textTheme.titleMedium,
                        maxLines: 2,
                      ),
                      Text(
                        cast.character,
                        style: textTheme.bodyMedium!.copyWith(
                          color: Colors.white70,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
