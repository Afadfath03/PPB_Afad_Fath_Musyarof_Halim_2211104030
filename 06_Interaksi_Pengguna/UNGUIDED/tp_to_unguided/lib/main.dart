import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TugasPendahuluan(),
    );
  }
}

class TugasPendahuluan extends StatefulWidget {
  const TugasPendahuluan({super.key});

  @override
  State<TugasPendahuluan> createState() => _TugasPendahuluanState();
}

class _TugasPendahuluanState extends State<TugasPendahuluan> {
  int _navIndex = 0;

  static const List<Widget> _navOption = <Widget>[
    Home(),
    Wisata(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _navIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        centerTitle: true,
        title: const Text('UNGUIDED'),
      ),
      body: Center(
        child: _navOption.elementAt(_navIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Wisata',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _navIndex,
        backgroundColor: Colors.amber[800],
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 8),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Submit'),
              ),
            ],
          )),
    );
  }
}

class Wisata extends StatelessWidget {
  const Wisata({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Ini adalah halaman Wisata'),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Ini adalah halaman Profil'),
      ),
    );
  }
}
