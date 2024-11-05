# PERTEMUAN KE 7

## NAVIGASI DAN NOTIFIKASI

---

### GUIDED

1. Model
   - Model Class 
``` dart
  class Product {
    final int id;
    final String nama;
    final String harga;
  
    Product({required this.id, required this.nama, required this.harga});
  
    // method untuk mengubah data json menjadi object
    factory Product.fromJson(Map<String, dynamic> json) {
      return Product(
        id: json['id'],
        nama: json['nama'],
        harga: json['harga'].toDouble(),
      );
    }
  
    // method untuk mengubah object menjadi json
    Map<String, dynamic> toJson() {
      return {
        'id': id,
        'nama': nama,
        'harga': harga,
      };
    }
  }
```

2. Navigasi
    - Main
    ``` dart
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                data: detailS,
              ),
            ));
      });
    ```
    - Detail

    ``` dart
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

    ```

---

### UNGUIDED

- Class Model
``` dart
class Product {
  final String nama;
  final String deskripsi;
  final double harga;
  final String gambar;
  Product({
    required this.nama,
    required this.deskripsi,
    required this.harga,
    required this.gambar,
  });
}
```

- Coding
  - main.dart
  ``` dart
  import 'package:flutter/material.dart';
  import 'package:unguided/page/product_list.dart';

  void main() {
    runApp(const MainApp());
  }

  class MainApp extends StatelessWidget {
    const MainApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'E-commerce App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductListPage(),
      );
    }
  }
  ```

  - product_list.dart
  ``` dart
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
        gambar: "../assets/images/laptop.jpg",
      ),
      Product(
        nama: "Smart Phone",
        deskripsi: "Stick Dragon 8",
        harga: 20000000,
        gambar: "../assets/images/smartphone.jpeg",
      ),
    ];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue, title: const Text("Product List")),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ListTile(
              leading: Image(image: AssetImage(product.gambar), width: 100),
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
  ```

  - product_detail.dart
  ``` dart
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
  ```

- Output
- Penjelasan
  - class model untuk menentukan data yang digunakan
  - `ListView.builder` untuk menampilkan list berdasarkan model yang sudah ada datanya
  - `Navigator.push` untuk navigasi ke halaman lain dari list tertentu
