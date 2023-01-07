import 'package:flutter/material.dart';
import 'package:mountain/homepage.dart';

void main() {
  runApp(const MountainApp());
}

class MountainApp extends StatefulWidget {
  const MountainApp({super.key});

  @override
  State<MountainApp> createState() => _MountainAppState();
}

class _MountainAppState extends State<MountainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
