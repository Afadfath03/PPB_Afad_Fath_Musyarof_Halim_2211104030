import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP_04',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Rekomendasi Wisata'),
      debugShowCheckedModeBanner: false,
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Curug Gede',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Image.network(
                "https://3.bp.blogspot.com/-e1arisbWBy4/W1_kfKtRFwI/AAAAAAAAANE/5UrDfjrpP64_3SoPOG0syLTCLVRuouQQgCLcBGAs/s1600/curug%2Bgedhe.jpg",
                width: 300,
                height: 200,
                fit: BoxFit.cover),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Curug Gede adalah salah satu destinasi wisata alam yang eksotis di Purwokerto, tepatnya di Desa Ketenger, Kecamatan Baturraden, Kabupaten Banyumas. Air terjun ini memiliki ketinggian sekitar 50 meter dan terletak di bawah Curug Bayan.',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Kunjungi Sekarang'),
            ),
          ],
        ),
      ),
    );
  }
}
