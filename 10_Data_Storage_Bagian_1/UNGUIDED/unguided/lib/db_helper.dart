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
