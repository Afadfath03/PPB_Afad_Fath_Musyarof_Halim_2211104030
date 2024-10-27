import 'package:flutter/material.dart';

void main() => runApp(const Tabbar());

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink[600],
            centerTitle: true,
            title: const Text('Pink Bro'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  text: 'Menu',
                ),
                Tab(
                  icon: Icon(
                    Icons.timelapse,
                    color: Colors.white,
                  ),
                  text: 'calender',
                ),
                Tab(
                    icon: Icon(
                      Icons.history,
                      color: Colors.white,
                    ),
                    text: 'History'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Menu(),
              Calender(),
              History(),
            ],
          ),
        ),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Menu'),
      ),
    );
  }
}

class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Calender'),
      ),
    );
  }
}

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('History'),
      ),
    );
  }
}
