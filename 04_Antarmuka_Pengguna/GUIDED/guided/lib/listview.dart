import 'package:flutter/material.dart';

void main() {
  runApp(const Latihan());
}

class Latihan extends StatelessWidget {
  const Latihan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LatihanList(title: 'Pertemuan 4'),
    );
  }
}

class LatihanList extends StatefulWidget {
  const LatihanList({super.key, required this.title});

  final String title;

  @override
  State<LatihanList> createState() => _LatihanListState();
}

class _LatihanListState extends State<LatihanList> {
  String kashtira =
      "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/13714538-e319-4cce-9062-6941ce18525d/dgd1fak-154cf1d1-ec56-49d3-8176-33f8cd3df7b1.png/v1/fill/w_894,h_894,q_70,strp/kashtira_arise_heart__artwork__by_nhociory_dgd1fak-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTAyNCIsInBhdGgiOiJcL2ZcLzEzNzE0NTM4LWUzMTktNGNjZS05MDYyLTY5NDFjZTE4NTI1ZFwvZGdkMWZhay0xNTRjZjFkMS1lYzU2LTQ5ZDMtODE3Ni0zM2Y4Y2QzZGY3YjEucG5nIiwid2lkdGgiOiI8PTEwMjQifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.Z0uzIQO_i-TECkq8ZFzrRdEHi5pT95rIucsq8u2nBsM";
  String tear =
      "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/91c64743-70df-48d8-bc46-032dcb781164/dfiqcsu-bfe2d5e6-7d00-427c-85be-c902f8428f1f.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzkxYzY0NzQzLTcwZGYtNDhkOC1iYzQ2LTAzMmRjYjc4MTE2NFwvZGZpcWNzdS1iZmUyZDVlNi03ZDAwLTQyN2MtODViZS1jOTAyZjg0MjhmMWYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.tuFzTP2yQJDEnu-aEqdn9cJHTo0L1r5d-tzWbNFD9HA";
  String manna =
      "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ffab794c-da2e-4a5a-9a1b-c5b06fd1c460/dfud8wn-554f394c-b5e4-4849-afbc-a62b4c2248ec.jpg/v1/fill/w_894,h_894,q_70,strp/visas_amritara_by_virgo4th_dfud8wn-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTIwMCIsInBhdGgiOiJcL2ZcL2ZmYWI3OTRjLWRhMmUtNGE1YS05YTFiLWM1YjA2ZmQxYzQ2MFwvZGZ1ZDh3bi01NTRmMzk0Yy1iNWU0LTQ4NDktYWZiYy1hNjJiNGMyMjQ4ZWMuanBnIiwid2lkdGgiOiI8PTEyMDAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.akQFElw3xAZA2pa5RC4sYk1W6DKL1AvDWLXRlm9Grrk";
  String visas =
      "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/e6e149b0-5f6a-40ef-bf5a-b3750c935986/dg6fh88-049cc76a-82d8-4cc0-a31c-ae0f36538b57.png/v1/fill/w_1192,h_670,q_70,strp/mannadium_riumheart_wallaper_by_hoangbg98_dg6fh88-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzIwIiwicGF0aCI6IlwvZlwvZTZlMTQ5YjAtNWY2YS00MGVmLWJmNWEtYjM3NTBjOTM1OTg2XC9kZzZmaDg4LTA0OWNjNzZhLTgyZDgtNGNjMC1hMzFjLWFlMGYzNjUzOGI1Ny5wbmciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.G0T2VWfQzKwWCJkcH7RJCrMa0wjP_CliV6WjQrgDY64";
  double sB = 15;

  @override
  Widget build(BuildContext context) {
    List<Widget> Liv = [
      Container(
          padding: const EdgeInsets.all(8),
          color: Colors.red[900],
          child: Image.network(kashtira, fit: BoxFit.cover)),
      SizedBox(height: sB),
      Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[200],
          child: Image.network(tear)),
      SizedBox(height: sB),
      Container(
          padding: const EdgeInsets.all(8),
          color: Colors.black87,
          child: Image.network(visas)),
      SizedBox(height: sB),
      Container(
        padding: const EdgeInsets.all(8),
        color: Colors.yellow[600],
        child: Image.network(
          manna,
          fit: BoxFit.cover,
        ),
      ),
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemCount: Liv.length,
          itemBuilder: (context, index) {
            return Liv[index];
          },
        )
        // body: ListView(padding: const EdgeInsets.all(8), children: Liv),
        );
  }
}
