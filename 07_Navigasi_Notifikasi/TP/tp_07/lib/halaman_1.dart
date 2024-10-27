import 'package:flutter/material.dart';

void main() => runApp(const Halaman1());

class Halaman1 extends StatelessWidget {
  const Halaman1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Halaman Satu")
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/halamanDua');
          },
          child: Text("Ke Halaman Dua", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
