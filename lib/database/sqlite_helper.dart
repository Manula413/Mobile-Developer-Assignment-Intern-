import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user_model.dart';

class SQLiteHelper {
  static const _databaseName = "app_database.db";
  static const _userTable = "user";

  static Future<Database> _initializeDb() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, _databaseName),
      onCreate: (db, version) async {
        await db.execute(''' 
          CREATE TABLE $_userTable (
            userCode TEXT PRIMARY KEY,
            displayName TEXT,
            email TEXT,
            employeeCode TEXT,
            companyCode TEXT
          )
        ''');
      },
      version: 1,
    );
  }

  // Modify the saveUser method to replace the existing record if the userCode already exists
  static Future<void> saveUser(UserModel user) async {
    final db = await _initializeDb();
    await db.insert(
      _userTable,
      {
        'userCode': user.userCode,
        'displayName': user.displayName,
        'email': user.email,
        'employeeCode': user.employeeCode,
        'companyCode': user.companyCode,
      },
      conflictAlgorithm: ConflictAlgorithm.replace, // Replace the existing record if userCode exists
    );
  }
}
