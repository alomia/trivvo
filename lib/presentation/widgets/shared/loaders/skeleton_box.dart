import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonBox extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const SkeletonBox({
    super.key,
    this.width = 250.0,
    this.height = 250.0,
    this.borderRadius = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(borderRadius),
        child: Container(width: width, height: height, color: Colors.grey),
      ),
    );
  }
}
