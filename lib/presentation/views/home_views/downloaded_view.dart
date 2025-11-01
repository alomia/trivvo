import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:trivvo/presentation/widgets/widgets.dart';

class DownloadedView extends StatelessWidget {
  const DownloadedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmptyState(
        icon: PhosphorIconsRegular.downloadSimple,
        message: 'Aún no tienes películas descargadas',
      ),
    );
  }
}
