import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:trivvo/presentation/widgets/widgets.dart';

class MoviesHorizontalSkeleton extends StatelessWidget {
  const MoviesHorizontalSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: SizedBox(
        height: 300.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  SkeletonBox(width: 100.0, height: 15.0, borderRadius: 10.0),
                  Spacer(),
                  SkeletonBox(width: 80.0, height: 15.0, borderRadius: 10.0),
                ],
              ),
            ),

            SizedBox(height: 20.0),

            Expanded(
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: SkeletonBox(width: 166.5, borderRadius: 10.0),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
