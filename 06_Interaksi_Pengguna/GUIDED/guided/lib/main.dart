import 'package:flutter/material.dart';
import 'package:guided/bottomTabBar.dart';
import 'package:guided/form.dart';
import 'package:guided/pack.dart';
import 'package:guided/tabbar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const BottTabBar(),
    );
  }
}
