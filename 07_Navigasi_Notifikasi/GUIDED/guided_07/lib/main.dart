import 'package:flutter/material.dart';
import 'package:guided_07/pages/MyPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyPageApp(),
      ),
    );
  }
}
