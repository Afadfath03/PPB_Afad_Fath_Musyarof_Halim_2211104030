import 'package:flutter/material.dart';
import 'db_helper.dart';

void main() {
  runApp(DbView());
}

class DbView extends StatelessWidget {
  const DbView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Halaman(),
    );
  }
}

class Halaman extends StatefulWidget {
  const Halaman({super.key});

  @override
  State<Halaman> createState() => _HalamanState();
}

class _HalamanState extends State<Halaman> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> biodata = [];
  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  void _refreshData() async {
    final data = await dbHelper.queryAllRows();
    setState(() {
      biodata = data;
    });
  }

  void navigateAddData(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InputFormScreen()),
    );
    if (result == true) _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('SQLite Biodata Mahasiswa'),
      ),
      body: biodata.isEmpty
          ? Center(child: Text('No data'))
          : ListView.builder(
              itemCount: biodata.length,
              itemBuilder: (context, index) {
                final data = biodata[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  color: Colors.blue[50],
                  child: ListTile(
                    title: Text(
                      data['nama'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 1.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('NIM: ${data['nim']}'),
                          Text('Alamat: ${data['alamat']}'),
                          Text('Hobi: ${data['hobi']}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateAddData(context),
        child: Icon(Icons.add),
      ),
    );
  }
}

class InputFormScreen extends StatelessWidget {
  InputFormScreen({super.key});
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController hobiController = TextEditingController();
  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Tambah Biodata Mahasiswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration:
                  InputDecoration(labelText: 'Nama', icon: Icon(Icons.person)),
            ),
            TextField(
              controller: nimController,
              decoration: InputDecoration(
                  labelText: 'Nim', icon: Icon(Icons.confirmation_number)),
            ),
            TextField(
              controller: alamatController,
              decoration:
                  InputDecoration(labelText: 'Alamat', icon: Icon(Icons.home)),
            ),
            TextField(
              controller: hobiController,
              decoration: InputDecoration(
                  labelText: 'Hobi', icon: Icon(Icons.stars_sharp)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await dbHelper.insert({
                  'nama': namaController.text,
                  'nim': nimController.text,
                  'alamat': alamatController.text,
                  'hobi': hobiController.text,
                });
                Navigator.pop(context, true);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
