import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'user_data.db');
    return await openDatabase(
      path,
      version: 2, // Increment the version here
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_code TEXT UNIQUE,
            display_name TEXT,
            email TEXT,
            employee_code TEXT,
            company_code TEXT
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          // Add missing columns
          await db.execute('''ALTER TABLE users ADD COLUMN employee_code TEXT;''');
          await db.execute('''ALTER TABLE users ADD COLUMN display_name TEXT;''');
        }
      },
    );
  }

  // Insert user data into the database
  Future<void> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    await db.insert(
      'users',
      {
        'user_code': user['User_Code'],
        'display_name': user['User_Display_Name'],
        'email': user['Email'],
        'employee_code': user['User_Employee_Code'],
        'company_code': user['Company_Code'],
      },
      conflictAlgorithm: ConflictAlgorithm.replace, // This will update if the user already exists
    );
  }

  // Get user by user code
  Future<Map<String, dynamic>?> getUser(String userCode) async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('users', where: 'user_code = ?', whereArgs: [userCode]);

    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }
}
