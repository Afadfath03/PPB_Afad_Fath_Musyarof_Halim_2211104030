import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pertemuan 5',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CusScroll(title: 'Antarmuka Lanjutan'),
    );
  }
}

class CusScroll extends StatefulWidget {
  const CusScroll({super.key, required this.title});

  final String title;

  @override
  State<CusScroll> createState() => _CusScrollState();
}

class _CusScrollState extends State<CusScroll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          //Sliver App Bar
          const SliverAppBar(
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("Sliver App Bar"),
                background: Image(
                  image: NetworkImage(
                      "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/259cec05-4df3-49e1-91a8-34300da42af4/dgbtnhd-eea72567-501a-4615-bcc3-0d0cdf7ddf62.png/v1/fill/w_991,h_806/kashtira_arise_heart_full_render_by_ygofaraday_dgbtnhd-pre.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MjM4NyIsInBhdGgiOiJcL2ZcLzI1OWNlYzA1LTRkZjMtNDllMS05MWE4LTM0MzAwZGE0MmFmNFwvZGdidG5oZC1lZWE3MjU2Ny01MDFhLTQ2MTUtYmNjMy0wZDBjZGY3ZGRmNjIucG5nIiwid2lkdGgiOiI8PTI5MzUifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.55oq09CWkfgJ4T3RHQmxldVCPFzfnWoBTd8colROpFM"),
                  fit: BoxFit.cover,
                ),
                collapseMode: CollapseMode.none,
              )),
          //Sliver Grid
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('Grid Item $index'),
                );
              },
              childCount: 20,
            ),
          ),

          //Sliver Fixed List
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('List Item $index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
