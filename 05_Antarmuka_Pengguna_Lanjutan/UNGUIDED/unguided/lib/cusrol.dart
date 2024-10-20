import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UNGUIDED',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CusRol(title: 'Tempat Wisata Banyumas'),
    );
  }
}

class CusRol extends StatefulWidget {
  const CusRol({super.key, required this.title});

  final String title;

  @override
  State<CusRol> createState() => _CusRolState();
}

class _CusRolState extends State<CusRol> {
  @override
  Widget build(BuildContext context) {
    double sB = 5;
    List<Map<String, String>> tempatWisata = [
      {
        "title": "Miniatur Dunia Purwokerto",
        "subtitle": "Lihat dan kunjungi miniatur bangunan terkenal di dunia",
        "image": "../lib/assets/miniatur_dunia_pwt.jpg"
      },
      {
        "title": "Baturaden",
        "subtitle": "Nikmati keindahan alam dan udara sejuk dan damai",
        "image": "../lib/assets/baturaden.jpg"
      },
      {
        "title": "Pancuran 3",
        "subtitle": "Mandi air panas alami yang menyehatkan dan menyegarkan",
        "image": "../lib/assets/pancuran3.jpg"
      },
      {
        "title": "Goa Sarabadak",
        "subtitle": "Goa yang terbuat dari endapan air belerang",
        "image": "../lib/assets/sarabadak.jpg"
      },
      {
        "title": "Telaga Sunyi",
        "subtitle": "Telaga yang tersembunyi di tengah hutan",
        "image": "../lib/assets/sunyi.jpg"
      },
      {
        "title": "Curug Bayan",
        "subtitle": "Air terjun di tengah hutan alami",
        "image": "../lib/assets/bayan.jpg"
      },
      {
        "title": "Hutan Pinus Limakuwus",
        "subtitle": "Tempat untuk menenangkan diri dan menyegarkan pikiran",
        "image": "../lib/assets/limpakuwus.jpg"
      },
    ];

    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      //Sliver App Bar
      const SliverAppBar(
          pinned: true,
          expandedHeight: 150.0,
          backgroundColor: Colors.amber,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              "Rekomendasi Tempat Wisata",
              style: TextStyle(fontSize: 20),
            ),
            collapseMode: CollapseMode.none,
          )),
      SliverList(
          delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index >= tempatWisata.length) return null;
          return Padding(
            padding: EdgeInsets.all(sB),
            child: Card(
              child: ListTile(
                leading: Image.asset(
                  tempatWisata[index]["image"]!,
                  height: 70,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  tempatWisata[index]["title"]!,
                  style: const TextStyle(
                      fontSize: 13.5, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  tempatWisata[index]["subtitle"]!,
                  style: const TextStyle(fontSize: 13),
                ),
              ),
            ),
          );
        },
        childCount: tempatWisata.length, // Total item yang ingin ditampilkan
      ))
    ]));
  }
}
