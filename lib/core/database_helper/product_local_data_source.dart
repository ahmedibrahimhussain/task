import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../features/home_feature/data/model/products_model.dart';

class ProductLocalDataSource {
  static final ProductLocalDataSource _instance = ProductLocalDataSource._internal();
  factory ProductLocalDataSource() => _instance;
  ProductLocalDataSource._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    final path = join(await getDatabasesPath(), 'products_v2.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE products(
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

  Future<void> cacheProducts(List<ProductModel> products) async {
    final db = await database;


    await db.delete('products');

    final batch = db.batch();
    for (var product in products) {
      batch.insert(
        'products',
        product.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<List<ProductModel>> getCachedProducts({int limit = 10}) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'products',
      limit: limit,
    );
    return maps.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<void> clearCache() async {
    final db = await database;
    await db.delete('products');
  }
}
