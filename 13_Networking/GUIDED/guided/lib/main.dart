import 'package:flutter/material.dart';
import 'package:guided/view_model/homepage.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyMain(),
  ));
}

class MyMain extends StatelessWidget {
  const MyMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(title: "Counter App"),
    );
  }
}
