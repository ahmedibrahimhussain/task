import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../features/home_feature/data/model/products_model.dart';

class DetailsLocalDataSource {
  static final DetailsLocalDataSource _instance =
      DetailsLocalDataSource._internal();
  factory DetailsLocalDataSource() => _instance;
  DetailsLocalDataSource._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    final path = join(await getDatabasesPath(), 'details.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE product_details(
            id INTEGER PRIMARY KEY,
            title TEXT,
            price REAL,
            description TEXT,
            category TEXT,
            image TEXT
          )
        ''');
      },
    );
    return _database!;
  }

  Future<void> cacheProduct(ProductModel product) async {
    final db = await database;

    await db.delete(
      'product_details',
      where: 'id = ?',
      whereArgs: [product.id],
    );

    await db.insert(
      'product_details',
      product.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<ProductModel?> getCachedProduct(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'product_details',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return ProductModel.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<void> clearCache() async {
    final db = await database;
    await db.delete('product_details');
  }
}
