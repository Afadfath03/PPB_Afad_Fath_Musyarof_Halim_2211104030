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
---

### UNGUIDED

