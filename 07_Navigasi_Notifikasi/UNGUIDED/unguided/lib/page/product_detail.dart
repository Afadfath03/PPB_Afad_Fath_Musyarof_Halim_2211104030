import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text(product.nama)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(product.gambar), height: 250),
            const SizedBox(height: 16.0),
            Text(product.nama, style: const TextStyle(fontSize: 24.0)),
            const SizedBox(height: 8.0),
            Text("Rp. ${product.harga}",
                style: const TextStyle(fontSize: 24.0)),
            const SizedBox(height: 16.0),
            Text(product.deskripsi),
          ],
        ),
      ),
    );
  }
}
