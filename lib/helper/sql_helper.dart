import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._();

  DatabaseService._();

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initializeDatabase();
    return _database;
  }

  Future<Database?> initializeDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'favorites.db');

    _database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        String sql = '''
            CREATE TABLE favorites (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            quote TEXT,
            author TEXT,
            isLike INTEGER,
            category TEXT,
            image TEXT
         )''';
        db.execute(sql);
      },
    );

    return _database;
  }

  Future<void> addFavorite(String? quote, String? author, bool? isLike, String? category, String? image) async {
    final db = await database;
    String sql = 'INSERT INTO favorites (quote, author, isLike, category, image) VALUES(?,?,?,?,?)';
    List arg = [quote, author, isLike! ? 1 : 0, category, image];
    await db!.rawInsert(sql, arg);
  }

  Future<List<Map<String, Object?>>> getFavorites() async {
    final db = await database;
    String sql = 'SELECT * FROM favorites';
    return await db!.rawQuery(sql);
  }

  Future<void> deleteFavorite(String quote) async {
    final db = await database;
    String sql = 'DELETE FROM favorites WHERE quote = ?';
    await db!.rawDelete(sql, [quote]);
  }
}
