import 'package:flutter/material.dart';

class DownloadedView extends StatelessWidget {
  const DownloadedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Descargado')),
      body: Center(child: Text("Descargado")),
    );
  }
}
