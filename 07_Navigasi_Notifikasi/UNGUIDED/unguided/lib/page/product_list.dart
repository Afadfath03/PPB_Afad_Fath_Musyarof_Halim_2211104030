import 'package:flutter/material.dart';
import 'product_detail.dart';
import '../models/product.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({super.key});

  final List<Product> products = [
    Product(
      nama: "Laptop",
      deskripsi: "RTX 6090",
      harga: 25000000,
      gambar: "https://via.placeholder.com/150",
    ),
    Product(
      nama: "Smart Phone",
      deskripsi: "Stick Dragon 8",
      harga: 20000000,
      gambar: "https://via.placeholder.com/150",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product List")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.network(product.gambar),
            title: Text(product.nama),
            subtitle: Text("Rp. ${product.harga}"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
