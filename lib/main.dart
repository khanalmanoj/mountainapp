import 'package:flutter/material.dart';
import 'package:mountain/pages/homepage.dart';
import 'package:mountain/pages/loginpage.dart';
import 'widgets/theme.dart';

void main() {
  runApp(const MountainApp());
}

class MountainApp extends StatelessWidget {
  const MountainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Mytheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
