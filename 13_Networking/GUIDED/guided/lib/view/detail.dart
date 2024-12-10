import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Column(
          children: [
            const Center(
              child: Text('INI DETAIL BANG', style: TextStyle(fontSize: 24)),
            ),
            ElevatedButton(
                onPressed: () => Get.back(), 
                child: const Text("Back")),
          ],
        ),
      ),
    );
  }
}
