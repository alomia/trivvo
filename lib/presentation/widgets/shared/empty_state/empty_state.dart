import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String message;

  const EmptyState({super.key, required this.icon, required this.message});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Opacity(opacity: 0.5, child: Icon(icon, size: 60.0)),
          SizedBox(height: 12.0),
          Opacity(
            opacity: 0.5,
            child: Text(
              message,
              style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
