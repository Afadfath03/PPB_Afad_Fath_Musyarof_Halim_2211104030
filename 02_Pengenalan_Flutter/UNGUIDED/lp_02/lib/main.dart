// ignore_for_file: prefer_const_constructors

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
      title: 'LP_02 - 2211104030',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BIODATA'),
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
        backgroundColor: Colors.amber,
        title: Align(
          alignment: Alignment.center,
          child: Text('LP_02'),
        ),
      ),
      body: Padding(
        // widget padding di parent body
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text('BIODATA',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Container(
              color: Colors.amber.shade100,
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: const [
                  SizedBox(
                    width: 80,
                    child: Text("Nama ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textScaler: TextScaler.linear(1.2)),
                  ),
                  SizedBox(
                    child: Text("Afad Fath Musyarof Halim",
                        textScaler: TextScaler.linear(1.1)),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.amber.shade100,
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: const [
                  SizedBox(
                    width: 80,
                    child: Text("NIM ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textScaler: TextScaler.linear(1.2)),
                  ),
                  SizedBox(
                    child:
                        Text("2211104030", textScaler: TextScaler.linear(1.1)),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.amber.shade100,
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: const [
                  SizedBox(
                    width: 80,
                    child: Text("Kelas ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textScaler: TextScaler.linear(1.2)),
                  ),
                  SizedBox(
                    child:
                        Text("S1SE-06-01", textScaler: TextScaler.linear(1.1)),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.amber.shade100,
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: const [
                  SizedBox(
                    width: 80,
                    child: Text("Jenis Kelamin ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textScaler: TextScaler.linear(1.2)),
                  ),
                  SizedBox(
                    child:
                        Text("Laki Laki", textScaler: TextScaler.linear(1.1)),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.amber.shade100,
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: const [
                  SizedBox(
                    width: 80,
                    child: Text("Agama ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textScaler: TextScaler.linear(1.2)),
                  ),
                  SizedBox(
                    child: Text("Islam", textScaler: TextScaler.linear(1.1)),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.amber.shade100,
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: const [
                  SizedBox(
                    width: 80,
                    child: Text("Tempat Lahir ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textScaler: TextScaler.linear(1.2)),
                  ),
                  SizedBox(
                    child: Text("Wonosobo", textScaler: TextScaler.linear(1.1)),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.amber.shade100,
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: const [
                  SizedBox(
                    width: 80,
                    child: Text("Tanggal Lahir ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textScaler: TextScaler.linear(1.2)),
                  ),
                  SizedBox(
                    child: Text("01 Januari 2004",
                        textScaler: TextScaler.linear(1.1)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
