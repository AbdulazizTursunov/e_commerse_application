import 'package:e_commerse_application/data/local_db/local_db_model.dart';
import 'package:e_commerse_application/data/model/product_model/product_model.dart';
import '../../data/local_db/local_sql.dart';

class ProductRepository {
  final LocalDatabase _localDatabase = LocalDatabase();

  Future<void> insertProduct(ProductModel product) async =>
      await _localDatabase.insertProduct(product);


  Future<List<ProductModel>> getAllProduct() async {
    print("ProductModel db getAll ok");
     return  await _localDatabase.getAllProducts();}


  Future<void> deleteProduct(int productId) async =>
      await _localDatabase.deleteProductByID(productId);

  ///======================= method for  favorite ========///

  ///favorite tugmasini bosganda favoritlarga qo'shish uchun method

  Future<void> insertFavorites(ProductModel product) async =>
      await _localDatabase.insertFavorite(product);


  ///favorite pageda barcha qo'shilgan productlarni localDbdan o'qib berish uchun method

  Future<List<ProductModel>> getAllFavorites() async {
    print("ProductModel db getAll ok");
    return  await _localDatabase.getAllFavorites();}


  ///localDbga favorite sifatida saqlangan productlarni iproductId si bo'yicha delete qiladi

  Future<void> deleteFavoritesById(int productId) async =>
      await _localDatabase.deleteFavoriteByID(productId);

}