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


}