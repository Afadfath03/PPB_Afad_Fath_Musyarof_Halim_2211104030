import 'package:flutter/material.dart';
import 'package:guided/helper/db_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TestDbView());
}

class TestDbView extends StatefulWidget {
  const TestDbView({super.key});

  @override
  State<TestDbView> createState() => _TestDbViewState();
}

class _TestDbViewState extends State<TestDbView> {
  final DatabaseHelper db = DatabaseHelper();
  List<Map<String, dynamic>> _dbData = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    db.initDatabase();
    _refreshData();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _refreshData() async {
    final data = await db.queryAllRows();
    setState(() {
      _dbData = data;
    });
  }

  void _insertData() async {
    await db.insert({
      'name': _titleController.text,
      'email': _descriptionController.text,
    });
    _titleController.clear();
    _descriptionController.clear();
    _refreshData();
  }

  void _deleteData(int i) async {
    await db.delete(i);
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test DB View',
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Test DB View',
                  style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.blue,
            ),
            body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Column(children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _titleController,
                          decoration: const InputDecoration(labelText: 'Title'),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _descriptionController,
                          decoration:
                              const InputDecoration(labelText: 'Description'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              onPressed: _refreshData,
                              child: const Text('Refresh'))),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              onPressed: _insertData,
                              child: const Text('Insert Data'))),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _dbData.length,
                              itemBuilder: (context, i) {
                                return ListTile(
                                  title: Text(_dbData[i]['title']),
                                  subtitle: Text(_dbData[i]['description']),
                                  trailing: IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        _deleteData(_dbData[i]['id']);
                                      }),
                                );
                              })),
                    ],
                  )
                ]))));
  }
}
