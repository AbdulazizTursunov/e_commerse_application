import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/product_model/product_model.dart';
import 'local_db_model.dart';

class LocalDatabase {
  static final LocalDatabase instance = LocalDatabase._init();

  LocalDatabase._init();

  factory LocalDatabase() {
    return instance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("student_database.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER NOT NULL";
    const realType = "REAL DEFAULT 0.0";

    await db.execute('''
    CREATE TABLE ${LocalDbFields.productTable}(
    ${LocalDbFields.id} $intType,
    ${LocalDbFields.title} $textType,
    ${LocalDbFields.price} $realType,
    ${LocalDbFields.image} $textType,
    ${LocalDbFields.category} $textType,
    ${LocalDbFields.description} $textType
    );
    ''');
    await db.execute('''
    CREATE TABLE ${LocalDbFields.rate}(
    ${LocalDbFields.id} $intType,
    ${LocalDbFields.rate} $realType,
    ${LocalDbFields.count} $intType
    );
    ''');

    await db.execute('''
    CREATE TABLE ${LocalDbFields.favoriteTable}(
      ${LocalDbFields.id} $intType,
      ${LocalDbFields.title} $textType,
      ${LocalDbFields.price} $realType,
      ${LocalDbFields.image} $textType,
      ${LocalDbFields.category} $textType,
      ${LocalDbFields.description} $textType
    );
  ''');
  }

  /// =========================== product ==========================///
  Future<ProductModel> insertProduct(ProductModel product) async {
    final db = await instance.database;
    final int id =
        await db.insert(LocalDbFields.productTable, product.toJson());
    await db.insert(LocalDbFields.rateTable,
        product.rating.toJson()..addAll({"id": product.id}));
    return product.copyWith(id: id);
  }

  Future<List<ProductModel>> getAllProducts() async {
    List<ProductModel> allProduct = [];
    final db = await instance.database;
    allProduct = (await db.query(LocalDbFields.productTable))
        .map((e) => ProductModel.fromJson(e))
        .toList();
    return allProduct;
  }

  deleteProductByID(int id) async {
    final db = await instance.database;
    db.delete(
      LocalDbFields.productTable,
      where: "${LocalDbFields.id} = ?",
      whereArgs: [id],
    );
  }

  ///======================= favorites ========================///
  Future<ProductModel> insertFavorite(ProductModel product) async {
    final db = await instance.database;
    final int id =
        await db.insert(LocalDbFields.favoriteTable, product.toJson());
    return product.copyWith(id: id);
  }

  Future<List<ProductModel>> getAllFavorites() async {
    List<ProductModel> allProduct = [];
    final db = await instance.database;
    allProduct = (await db.query(LocalDbFields.favoriteTable))
        .map((e) => ProductModel.fromJson(e))
        .toList();
    return allProduct;
  }

  deleteFavoriteByID(int id) async {
    final db = await instance.database;
    db.delete(
      LocalDbFields.favoriteTable,
      where: "${LocalDbFields.id} = ?",
      whereArgs: [id],
    );
  }
}
