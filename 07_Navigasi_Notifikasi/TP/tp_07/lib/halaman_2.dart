import 'package:flutter/material.dart';

void main() => runApp(const Halaman2());

class Halaman2 extends StatelessWidget {
  const Halaman2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Halaman Dua")
        ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Kembali ke Halaman Satu", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
