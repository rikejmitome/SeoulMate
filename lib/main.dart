import 'package:flutter/material.dart';

void main() {
  runApp(const SeoulMateApp());
}

class SeoulMateApp extends StatelessWidget {
  const SeoulMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SeoulMate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2F80ED)),
      ),
      home: const Scaffold(body: Center(child: Text('SeoulMate'))),
    );
  }
}
