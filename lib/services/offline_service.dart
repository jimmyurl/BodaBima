// Create a new file: lib/services/offline_service.dart

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class OfflineService {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'insurance_app.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Create tables for offline storage
        await db.execute('''
          CREATE TABLE insurance_plans (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            type TEXT,
            plan_name TEXT,
            description TEXT,
            coverage_amount TEXT,
            monthly_premium TEXT,
            last_synced TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE pending_transactions (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            type TEXT,
            data TEXT,
            created_at TEXT,
            status TEXT
          )
        ''');
      },
    );
  }

  Future<void> saveInsurancePlans(List<dynamic> plans, String type) async {
    final db = await database;
    final batch = db.batch();

    // Clear existing plans of this type
    await db.delete('insurance_plans', where: 'type = ?', whereArgs: [type]);

    // Insert new plans
    for (var plan in plans) {
      batch.insert('insurance_plans', {
        'type': type,
        'plan_name': plan['plan_name'],
        'description': plan['description'],
        'coverage_amount': plan['coverage_amount'],
        'monthly_premium': plan['monthly_premium'],
        'last_synced': DateTime.now().toIso8601String(),
      });
    }

    await batch.commit();
  }

  Future<List<Map<String, dynamic>>> getOfflinePlans(String type) async {
    final db = await database;
    return await db.query(
      'insurance_plans',
      where: 'type = ?',
      whereArgs: [type],
    );
  }
}
