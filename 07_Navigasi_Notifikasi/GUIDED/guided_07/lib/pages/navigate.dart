import 'package:flutter/material.dart';
import 'package:guided_07/models/product.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.data});

  final Product data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Navigation', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Image.network(
                data.img,
                width: 200,
              ),
              Text(data.nama),
              Text(data.desc),
              Text("Rp. ${data.harga}"),
            ],
          ),
        ),
      ),
    );
  }
}
