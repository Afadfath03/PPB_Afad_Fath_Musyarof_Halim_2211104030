import 'package:flutter/material.dart';
import 'package:tp_07/halaman_1.dart';
import 'package:tp_07/halaman_2.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Halaman1(),
        '/halamanDua': (context) => Halaman2(),
      },
    );
  }
}
