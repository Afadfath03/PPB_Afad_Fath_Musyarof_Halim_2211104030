import 'package:flutter/material.dart';
import 'package:guided_07/models/product.dart';
import 'package:guided_07/pages/navigate.dart';

void main() => runApp(MyPageApp());

class MyPageApp extends StatelessWidget {
  MyPageApp({super.key});

  final List<Product> products = [
    Product(
        id: 1,
        nama: 'Buku',
        harga: 10000,
        img:
            'https://3.bp.blogspot.com/-8JvisF86ir0/VVW-O_lxkGI/AAAAAAAAJrQ/fvWLIkf41k4/s1600/gambar%2Bbuku%2B(28).jpg',
        desc: 'Buku tulis'),
    Product(
        id: 2,
        nama: 'Pensil',
        harga: 5000,
        img:
            'https://th.bing.com/th/id/OIP.yuaMmex-6f9EDghz-PBbmQHaM3?rs=1&pid=ImgDetMain',
        desc: 'Pensil 2B'),
    Product(
        id: 3,
        nama: 'Penghapus',
        harga: 2000,
        img:
            'https://asset.kompas.com/crops/8H6Grk1-tOVskDfa-J7gqyJEIX4=/4x0:500x330/750x500/data/photo/2020/03/21/5e75869d3efd9.jpg',
        desc: 'Penghapus karet'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test Page',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              const Text('Test Model', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final detailS = products[index];
            return ListTile(
                title: Text(detailS.nama),
                subtitle: Text(detailS.desc),
                leading: Image.network(
                  detailS.img,
                  width: 100,
                ),
                trailing: Text("Rp. ${detailS.harga}"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          data: detailS,
                        ),
                      ));
                });
          },
        ),
      ),
    );
  }
}
