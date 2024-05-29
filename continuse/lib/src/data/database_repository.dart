import 'package:continuse_2/src/domain/product.dart';

abstract class DatabaseRepository {
  Future<void> addProduct(Product product);
  Future<void> deleteProduct(Product product);
  Future<List<Product>> getAllProduct();
}
