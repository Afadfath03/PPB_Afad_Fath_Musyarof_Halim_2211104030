# PERTEMUAN KE 10

## Data Storage Bagian 1

---

### GUIDED
1. Database Helper
   ``` dart
    import 'package:sqflite/sqflite.dart';
    import 'package:path/path.dart';
    
    class DatabaseHelper {
      static final DatabaseHelper _instance = DatabaseHelper.internal();
      static Database? _db;
    
      factory DatabaseHelper() => _instance;
    
      //Constructor
      DatabaseHelper.internal();
    
      Future<Database?> get database async {
        if (_db != null) {
          _db = await initDatabase();
          return _db;
        }
        return _db;
      }
    
      Future<Database> initDatabase() async {
        String path = join(await getDatabasesPath(), 'dbku.db');
    
        return await openDatabase(
          path,
          version: 1,
          onCreate: _onCreate,
        );
      }
    
      Future<void> _onCreate(Database db, int version) async {
        await db.execute('''
            CREATE TABLE users(
            id INTEGER PRIMARY KEY, 
            name TEXT, 
            email TEXT, 
            password TEXT)
          ''');
      }
    
      Future<int?> insert(Map<String, dynamic> row) async {
        Database? db = await database;
    
        return await db?.insert('users', row);
      }
    
      Future<List<Map<String, dynamic>>> readAll() async {
        Database? db = await database;
    
        return await db!.query('users');
      }
    
      Future<int?> update(Map<String, dynamic> row) async{
        Database? db = await database;
        int id = row['id'];
    
        return await db?.update('users', row, where: 'id = ?', whereArgs: [id]);
      }
    
      Future<int?> delete(int id) async{
        Database? db = await database;
    
        return await db?.delete('users', where: 'id = ?', whereArgs: [id]);
      }
    }
   ```
2. Database View
   ``` dart
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
   ```
---
### UNGUIDED
``` txt
(Soal) Buatlah sebuah project aplikasi Flutter dengan SQLite untuk menyimpan data biodata mahasiswa yang terdiri dari nama, NIM, domisili, dan hobi. Data yang dimasukkan melalui form akan ditampilkan dalam daftar di halaman utama.
Alur Aplikasi:
a) Form Input: Buat form input untuk menambahkan biodata mahasiswa, dengan kolom:
   - Nama
   - Nim
   - Alamat
   - Hobi
b) Tampilkan Daftar Mahasiswa: Setelah data berhasil ditambahkan, tampilkan daftar semua data mahasiswa yang sudah disimpan di halaman utama.
c) Implementasikan fitur Create (untuk menyimpan data mahasiswa) dan Read (untuk menampilkan daftar mahasiswa yang sudah disimpan).
```

1. Source Code
   1. helper
      ``` dart
      import 'package:sqflite/sqflite.dart';
      import 'package:path/path.dart';
      
      class DatabaseHelper {
        static final DatabaseHelper _instance = DatabaseHelper._internal();
        static Database? _database;
      
        factory DatabaseHelper() => _instance;
      
        //Constructor
        DatabaseHelper._internal();
      
        Future<Database> get database async {
          if (_database != null) return _database!;
          {
            _database = await initDatabase();
            return _database!;
          }
        }
      
        Future<Database> initDatabase() async {
          String path = join(await getDatabasesPath(), 'biodata.db');
      
          return await openDatabase(
            path,
            version: 1,
            onCreate: _onCreate,
          );
        }
      
        Future<void> _onCreate(Database db, int version) async {
          await db.execute('''
          CREATE TABLE mahasiswa(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            nama TEXT, 
            nim TEXT,
            alamat TEXT,
            hobi TEXT
          )
        ''');
        }
      
        Future<int> insert(Map<String, dynamic> row) async {
          Database db = await database;
      
          return await db.insert('mahasiswa', row);
        }
      
        Future<List<Map<String, dynamic>>> queryAllRows() async {
          Database db = await database;
      
          return await db.query('mahasiswa');
        }
      
        Future<int> update(Map<String, dynamic> row) async {
          Database db = await database;
          int id = row['id'];
      
          return await db.update('mahasiswa', row, where: 'id = ?', whereArgs: [id]);
        }
      
        Future<int> delete(int id) async {
          Database db = await database;
      
          return await db.delete('mahasiswa', where: 'id = ?', whereArgs: [id]);
        }
      
        Future<List<Map<String, dynamic>>> getItem(int id) async {
          Database db = await database;
      
          return await db.query('mahasiswa', where: 'id = ?', whereArgs: [id]);
        }
      }
      ```
   2. view
      ``` dart
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
      ```
2. Output
   1. home <br> ![home](https://github.com/user-attachments/assets/3193a52c-7fd1-46c3-b611-20563c1c45e0)

   2. input <br> ![input](https://github.com/user-attachments/assets/45f4072d-158c-4f4c-bfd2-e548b73f328b)

3. Penjelasan
   1. helper berisi fungsi yang diperlukan untuk menggunakan sqlite seperti buat database, buat table, isi table, hapus data, ubah data
   2. `_refreshData` untuk memperbarui tampilan setelah perubahan data
   3. `navigateAddData` untuk pindah ke halaman input setelah menekan floatingActionButton
   4. `Listview` untuk menampilkan daftar data yang ada pada database
   5. `InputFormScreen` berisi form untuk inputan

