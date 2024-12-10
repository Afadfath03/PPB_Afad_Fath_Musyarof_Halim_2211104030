import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guided/view/detail.dart';
import 'package:guided/view/homepage.dart';

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
    return GetMaterialApp(
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => HomePage(title: "Counter App")),
        GetPage(name: "/detail", page: () => DetailPage(title: "Detail Page")),
      ],
      debugShowCheckedModeBanner: false,
      home: HomePage(title: "Counter App"),
    );
  }
}
