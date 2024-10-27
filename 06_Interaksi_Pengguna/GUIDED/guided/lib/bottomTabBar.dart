import 'package:flutter/material.dart';
import 'package:guided/form.dart';
import 'package:guided/pack.dart';
import 'package:guided/tabbar.dart';

void main() => runApp(const BottTabBar());

class BottTabBar extends StatefulWidget {
  const BottTabBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BottTabBarState();
  }
}

class _BottTabBarState extends State<BottTabBar> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    const List<Widget> page = <Widget>[
      FormApp(),
      Tabbar(),
      TestPack(),
    ];

    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[600],
          centerTitle: true,
          title: const Text('Bottom Tab Bar',
              style: TextStyle(color: Colors.white)),
        ),
        body: page[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          backgroundColor: Colors.pink[600],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}
