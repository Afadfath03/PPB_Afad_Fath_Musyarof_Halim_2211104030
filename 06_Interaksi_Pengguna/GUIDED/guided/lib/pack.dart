import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const TestPack());

class TestPack extends StatelessWidget {
  const TestPack({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
          textTheme: GoogleFonts.poppinsTextTheme(),
          useMaterial3: true),
      home: const Scaffold(
        body: Center(
          child: Text(
            'MEONG',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
