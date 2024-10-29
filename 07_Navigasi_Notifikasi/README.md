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
