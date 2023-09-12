import 'package:e_commerse_application/data/local_db/local_db_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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
    ${LocalDbFields.id} $idType,
    ${LocalDbFields.title} $textType,
    ${LocalDbFields.price} $textType,
    ${LocalDbFields.image} $textType,
    ${LocalDbFields.category} $textType,
    ${LocalDbFields.description} $textType
    );
    ''');
  }

  Future<ProductModelLocalDb> insertProduct(ProductModelLocalDb product) async {
    final db = await instance.database;
    final int id =
    await db.insert(LocalDbFields.productTable, product.toJson());
    return product.copyWith(id: id);
  }

  Future<List<ProductModelLocalDb>> getAllProducts() async {
    List<ProductModelLocalDb> allStudents = [];
    final db = await instance.database;
    allStudents = (await db.query(LocalDbFields.productTable,))
        .map((e) => ProductModelLocalDb.fromJson(e))
        .toList();
    return allStudents;
  }



  deleteProductByID(int id) async {
    final db = await instance.database;
    db.delete(
      LocalDbFields.productTable,
      where: "${LocalDbFields.id} = ?",
      whereArgs: [id],
    );
  }

}
