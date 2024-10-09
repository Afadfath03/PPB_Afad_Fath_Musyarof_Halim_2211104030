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
      home: const MyHomePage(title: 'Tempat Wisata Banyumas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double sB = 10;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsets.all(sB),
              child: Card(
                child: ListTile(
                  leading: Image.asset(
                      height: 70,
                      width: 100,
                      '../lib/assets/miniatur_dunia_pwt.jpg',
                      fit: BoxFit.cover),
                  title: Text('Miniatur Dunia Purwokerto',
                      style: TextStyle(
                          fontSize: 13.5, fontWeight: FontWeight.bold)),
                  subtitle: Text(
                      'Lihat dan kunjungi miniatur bangunan terkenal di dunia',
                      style: TextStyle(fontSize: 13)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(sB),
              child: Card(
                child: ListTile(
                  leading: Image.asset(
                      height: 70,
                      width: 100,
                      '../lib/assets/baturaden.jpg',
                      fit: BoxFit.cover),
                  title: Text('Baturaden',
                      style: TextStyle(
                          fontSize: 13.5, fontWeight: FontWeight.bold)),
                  subtitle: Text(
                      'Nikmati keindahan alam dan udara sejuk dan damai',
                      style: TextStyle(fontSize: 13)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(sB),
              child: Card(
                child: ListTile(
                  leading: Image.asset(
                      height: 70,
                      width: 100,
                      '../lib/assets/pancuran3.jpg',
                      fit: BoxFit.cover),
                  title: Text('Pancuran 3',
                      style: TextStyle(
                          fontSize: 13.5, fontWeight: FontWeight.bold)),
                  subtitle: Text(
                      'Mandi air panas alami yang menyehatkan dan menyegarkan',
                      style: TextStyle(fontSize: 13)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(sB),
              child: Card(
                child: ListTile(
                  leading: Image.asset(
                      height: 70,
                      width: 100,
                      '../lib/assets/sarabadak.jpg',
                      fit: BoxFit.cover),
                  title: Text('Goa Sarabadak',
                      style: TextStyle(
                          fontSize: 13.5, fontWeight: FontWeight.bold)),
                  subtitle: Text('Goa yang terbuat dari endapan air belerang',
                      style: TextStyle(fontSize: 13)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(sB),
              child: Card(
                child: ListTile(
                  leading: Image.asset(
                      height: 70,
                      width: 100,
                      '../lib/assets/sunyi.jpg',
                      fit: BoxFit.cover),
                  title: Text('Telaga Sunyi',
                      style: TextStyle(
                          fontSize: 13.5, fontWeight: FontWeight.bold)),
                  subtitle: Text('Telaga yang tersembunyi di tengah hutan',
                      style: TextStyle(fontSize: 13)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(sB),
              child: Card(
                child: ListTile(
                  leading: Image.asset(
                      height: 70,
                      width: 100,
                      '../lib/assets/bayan.jpg',
                      fit: BoxFit.cover),
                  title: Text('Curug Bayan',
                      style: TextStyle(
                          fontSize: 13.5, fontWeight: FontWeight.bold)),
                  subtitle: Text('Air terjun di tengah hutan alami',
                      style: TextStyle(fontSize: 13)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(sB),
              child: Card(
                child: ListTile(
                  leading: Image.asset(
                      height: 70,
                      width: 100,
                      '../lib/assets/limpakuwus.jpg',
                      fit: BoxFit.cover),
                  title: Text('Hutan Pinus Limakuwus',
                      style: TextStyle(
                          fontSize: 13.5, fontWeight: FontWeight.bold)),
                  subtitle: Text(
                      'Tempat untuk menenangkan diri dan menyegarkan pikiran',
                      style: TextStyle(fontSize: 13)),
                ),
              ),
            ),
          ],
        ));
  }
}
