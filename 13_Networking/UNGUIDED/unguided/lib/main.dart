import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pagehome.dart';
import 'tambah.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Catatan',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Homepage()),
        GetPage(name: '/tambah', page: () => TambahCatatan())
      ],
    );
  }
}
